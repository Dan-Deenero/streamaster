import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text('Register', style: TextStyle(color: Colors.black, fontSize: 30),),
                )
            )

          ],
        ),
      ),
    );
  }
}
