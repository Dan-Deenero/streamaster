import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/views/main_auth/login.dart';
import 'package:streamaster/features/presentation/widgets/app_button.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/app_textformfield.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/utils/helpers/validators.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static final username = TextEditingController();
  static final email = TextEditingController();
  static final password = TextEditingController();
  static final confirmPassword = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void signUp(
    String email,
    String username,
    String password,
    String confirmPassword,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (password == confirmPassword) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  postDetailsToFirestore(email, username, 'No 1 willams street',
                      'assets/images/photos/s1.png')
                })
            .catchError((e) {});

        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Congratulations',
            message: 'Account Created Succesfully',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        showErrorMessage("password don't match!");
      }
      router.pop();
    } on FirebaseAuthException catch (e) {
      router.pop();
      showErrorMessage(e.code);
    }
  }

  postDetailsToFirestore(String email, String username, String address,
      String profilePicture) async {
    FirebaseFirestore fire = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = fire.collection('users');
    ref.doc(user!.uid).set({
      'email': email,
      'isAdmin': false,
      'username': username,
      'address': address,
      'profilePicture': profilePicture
    });
    router.go(AppRoutes.login);
  }

  void dispose() {
    email.dispose();
    username.dispose();
    super.dispose();
  }

  // To toggle password visibility

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: GestureDetector(
            onTap: () {
              router.pop;
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
        child: Column(
          children: [
            Image.asset(
              'assets/images/photos/DARK-DEV-X.png',
              width: 150,
              height: 200,
            ),
            customText(
                text: 'Let’s Get Started',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: Theme.of(context).colorScheme.secondary),
            heightSpace(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: customText(
                  text: 'Enter your details to register with StreamMaster',
                  textAlignment: TextAlign.center,
                  fontSize: 15,
                  textColor: Theme.of(context).colorScheme.secondary),
            ),
            heightSpace(4),
            CustomTextFormField(
              hintText: 'Username',
              textEditingController: username,
              validator: stringValidation,
            ),
            heightSpace(1),
            CustomTextFormField(
              hintText: 'email',
              textEditingController: email,
              validator: emailValidation,
            ),
            heightSpace(1),
            CustomTextFormField(
              isPassword: true,
              hintText: 'Password',
              textEditingController: password,
              validator: passwordValidation,
            ),
            heightSpace(1),
            CustomTextFormField(
              isPassword: true,
              hintText: 'confirmPassword',
              textEditingController: confirmPassword,
              validator: passwordValidation,
            ),
            heightSpace(3),
            AppButton(
              buttonText: 'Register',
              color: AppColors.purple,
              onTap: () {
                signUp(email.text, username.text, password.text,
                    confirmPassword.text);
              },
            ),
            heightSpace(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: "or if you already have an account?,",
                    fontSize: 15,
                    textColor: Theme.of(context).colorScheme.secondary),
                widthSpace(2),
                GestureDetector(
                    onTap: () {
                      router.go(AppRoutes.login);
                    },
                    child: customText(
                        text: "Log in",
                        fontSize: 15,
                        textColor: AppColors.purple))
              ],
            )
          ],
        ),
      )),
    );
  }
}
