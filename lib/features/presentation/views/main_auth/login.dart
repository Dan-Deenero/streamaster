import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true; // To toggle password visibility
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const  Color(0xFF121212),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white,),

      ),
      body:  SingleChildScrollView(
        child: Column(

          children: [
            const SizedBox(height: 20,),
            const Center(
                child: Text("Let's Get Started",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),)
            ),
            const  Center(
                child: Text('Enter your details to login', style: TextStyle(fontSize: 20, color: Colors.white),)
            ),

            const   Center(
                child: Text('with Stream Master ', style: TextStyle(fontSize: 20, color: Colors.white),)
            ),



            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                style: const  TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'John Doe',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF222222),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)
                    )
                ),
              ),
            ),






            Padding(
              padding:  const EdgeInsets.only(top: 10, left: 20, right: 20),

                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText, // Toggle password visibility
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: const  Color(0xFF222222),
                      filled: true,
                      suffixIcon:  GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },

                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                      ),


                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),



             const   Padding(
           padding:  EdgeInsets.only( top: 10, left: 260),
           child:  Text('forgot password?', style: TextStyle(color: AppColors.purple),),
         ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20,),
              child: Container(
                width: 365,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),)
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const  Center(
                child: Text('Or Login with', style: TextStyle(fontSize: 16, color: Colors.white),)
            ),


            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                  width: 365,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.black, size: 30,),
                      SizedBox(width: 12,),
                      Text('Log In with Apple', style: TextStyle(color: Colors.black, fontSize: 20),),
                    ],
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              child: Container(
                  width: 365,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icons/google.svg', color: Colors.white,
                        width: 20,
                        height: 20,),
                      const SizedBox(width: 12,),
                      const Text('Log In with Google', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  )
              ),
            ),


          ],

            )
        ),
      );

  }
}
