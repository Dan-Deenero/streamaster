import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const  Color(0xFFFAFAFA),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black,),

      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const Center(
                child: Text('Lets Get Started',style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),)
            ),
           const  Center(
                child: Text('Enter your details to register', style: TextStyle(fontSize: 20),)
            ),

          const   Center(
                child: Text('with Stream Master ', style: TextStyle(fontSize: 20),)
            ),
          const   Padding(
              padding: EdgeInsets.only(top: 20, right: 280),
              child: Text('Full Name', style: TextStyle(fontSize: 18),),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'John Doe',
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
              padding: EdgeInsets.only(top: 20, right: 300),
              child: Text('Email ID', style: TextStyle(fontSize: 18),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'johndoe@gmail.com',
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
              padding: EdgeInsets.only(top: 20, right: 280),
              child: Text('Password', style: TextStyle(fontSize: 18),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Password',

                    suffixIcon: const Icon(Icons.visibility),
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
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20,),
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
           const SizedBox(height: 10,),
           const  Center(
                child: Text('Or Register with', style: TextStyle(fontSize: 16),)
           ),


            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Container(
                width: 365,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple, color: Colors.white,),
                        SizedBox(width: 12,),
                        Text('Register with Apple', style: TextStyle(color: Colors.white, fontSize: 20),),
                      ],
                    )
                ),
              ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
              child: Container(
                  width: 365,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.white,),
                      SizedBox(width: 12,),
                      Text('Register with Google', style: TextStyle(color: Colors.white, fontSize: 20),),
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
