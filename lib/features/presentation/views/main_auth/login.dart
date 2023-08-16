import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/views/admin_pages/admin.dart';
import 'package:streamaster/features/presentation/widgets/app_button.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/app_textformfield.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/home/home.dart';
import 'package:streamaster/utils/helpers/validators.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  static final email = TextEditingController();
  static final password = TextEditingController();


  void signUserIn() async{

      showDialog(
        context: context, 
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    
     try {
      UserCredential user = await  FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User? firebaseUser = user.user;
      FirebaseFirestore.instance
                .collection('users')
                .doc(firebaseUser!.uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists) {
                    if (documentSnapshot.get('isAdmin') == true) {
                      router.go(AppRoutes.admin);
                    }else{
                      router.go(AppRoutes.authpage);
                    }      
                  } else {
                    print('Document does not exist on the database');
                  }
                });


          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            
            content: AwesomeSnackbarContent(
              title: 'On Snap!',
              message: 'Logged in scuccefully',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.success,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);      
      
    } 

    on FirebaseAuthException catch (e) {
     
      Navigator.of(context).pop();
      showErrorMessage(e.code);
    }
  }

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
            router.pop();
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white,)
        ),

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
        
            children: [
              Image.asset('assets/images/photos/DARK-DEV-X.png', width: 200, height: 200,),
              customText(text: 'Welcome Back StreamMaster', fontSize: 20, fontWeight: FontWeight.w700, textColor: Theme.of(context).colorScheme.secondary),
              heightSpace(3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: customText(text: 'Enter your details to login with StreamMaster', textAlignment: TextAlign.center, fontSize: 15,  textColor: Theme.of(context).colorScheme.secondary),
              ),
              heightSpace(5),
        
        
              CustomTextFormField(
                hintText: 'email',
                textEditingController: email,
                validator: emailValidation,
              ),

              heightSpace(2),

              CustomTextFormField(
                isPassword: true,
                hintText: 'Password',
                textEditingController: password,
                validator: passwordValidation,
              ),
        
        
              heightSpace(1),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        router.go(AppRoutes.resetPassword);
                      },
                      child: customText(
                          text: 'Forgot Password?', 
                          fontSize: 16, textColor: 
                          AppColors.purple, 
                          textAlignment: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              heightSpace(4),
              AppButton(
                buttonText: 'Log in', 
                color: AppColors.purple,
                onTap: () {
                  
                  signUserIn();
                },
              ),
              heightSpace(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(text: "or if you don’t have an account?," , fontSize: 15, textColor: Theme.of(context).colorScheme.secondary),
                  widthSpace(2),
                  GestureDetector(
                    onTap: () {
                      router.go(AppRoutes.createAccount);
                    },
                    child: customText(
                      text: "Register", 
                      fontSize: 15, 
                      textColor: AppColors.purple
                    ))
                ],
              )
            ],
        
              ),
        )
        ),
      );

  }
}
