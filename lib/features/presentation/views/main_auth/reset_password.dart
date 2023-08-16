import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/widgets/app_button.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/app_textformfield.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/utils/helpers/validators.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  static final email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }


  Future passwordReset() async{
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text.trim());
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
        message: 'Password reset link sent! check your email',

        
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: e.message.toString(),

        
          contentType: ContentType.failure,
        ),
      );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
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
              customText(text: 'Forgot Password?', fontSize: 20, fontWeight: FontWeight.w700, textColor: Theme.of(context).colorScheme.secondary),
              heightSpace(3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: customText(text: 'Enter your email to reset password', textAlignment: TextAlign.center, fontSize: 15,  textColor: Theme.of(context).colorScheme.secondary),
              ),
              heightSpace(5),
        
        
              CustomTextFormField(
                hintText: 'email',
                textEditingController: email,
                validator: emailValidation,
              ),

              heightSpace(3),
              AppButton(
                buttonText: 'Reset Password', 
                color: AppColors.purple,
                onTap: () {
                  passwordReset();
                },
              ),
              heightSpace(4),
            ],
        
              ),
        )
        ),
      );

  }
}
