import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool _obscureText = true; // To toggle password visibility
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const  Color(0xFF121212),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white,),

      ),
      body:  SingleChildScrollView(
        child: Column(

          children: [
           const SizedBox(height: 15,),
            const Center(
                child: Text("Let's Get Started",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),)
            ),
            const  Center(
                child: Text('Enter your details to register', style: TextStyle(fontSize: 20, color: Colors.white),)
            ),

            const   Center(
                child: Text('with Stream Master ', style: TextStyle(fontSize: 20, color: Colors.white),)
            ),



            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
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
              padding: const EdgeInsets.only(top: 10, left: 20, right: 17),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'johndoe@gmail.com',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF222222),
                    filled: true,
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




            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Phone number',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF222222),
                    filled: true,
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



            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                    child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),)
                ),

              ),
            ),
            const SizedBox(height: 30,),
            const  Center(
                child: Text('Or Register with', style: TextStyle(fontSize: 16, color: Colors.white),)
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
                      Text('Register with Apple', style: TextStyle(color: Colors.black, fontSize: 20),),
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
                      const Text('Register with Google', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  )
              ),
            ),


          ],
        ),
      ),
    );


  }
}
