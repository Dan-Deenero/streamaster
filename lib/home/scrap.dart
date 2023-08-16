import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';

class Scrap extends StatefulWidget {
  Scrap({super.key});

  @override
  State<Scrap> createState() => _ScrapState();
}

class _ScrapState extends State<Scrap> {
  
  final user = FirebaseAuth.instance.currentUser!;

  Future<String> _getUsername() async {
    final docRef = FirebaseFirestore.instance.collection("users").doc(user.uid);

    DocumentSnapshot snapshot = await docRef.get();

    return snapshot.get('username');
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).colorScheme.background,
      
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                heightSpace(7),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     customText(text: 'Good morning', fontSize: 24, textColor: Theme.of(context).colorScheme.surface ),
                     widthSpace(1),
                     FutureBuilder<String>(
                      future: _getUsername(),
                      builder: (context, snapshot){
                        return customText(text: snapshot.data.toString(), fontSize: 24, textColor: Theme.of(context).colorScheme.surface);
                      }
                     )
                     
                   ]
                 ),
                heightSpace(2),
                customText(text: '\$10000', fontSize: 28, textColor: AppColors.purple, textAlignment: TextAlign.center),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    subscribeDetails('20', 'Total Subscription'),
                    subscribeDetails('3', 'Payments This Week'),
                    subscribeDetails('2', 'Ongoing Free Trials')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(text: 'Upcoming', fontSize: 20, textColor: Theme.of(context).colorScheme.surface ),
                      Row(
                        children: [
                          customText(text: 'View All', fontSize: 16, textColor: Theme.of(context).colorScheme.surface),
                          Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).colorScheme.surface)
                        ],
                      )
                    ],
                  ),
                ),
                
        
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [                 
                      rowScroll(),
                      rowScroll(),
                      rowScroll(),
                      rowScroll(),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(text: 'Subscriptions', fontSize: 20, textColor: Theme.of(context).colorScheme.surface ),
                      Row(
                        children: [
                          customText(text: 'View All', fontSize: 15, textColor: Theme.of(context).colorScheme.surface),
                          Icon(Icons.arrow_forward_ios, size: 15, color: Theme.of(context).colorScheme.surface)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,bottom: 30,),
                  child: Row(
                    children: [
                      tabButton('Filter', FontAwesome.sliders,),
                      tabButton('Sorted by', FontAwesome.arrow_down_up_across_line,)
                    ],
                  ),
                ),
        
                tillage(context),
                heightSpace(1),
                tillage(context),
                heightSpace(1),
                tillage(context),
          
              ],
            ),
          ),
        ),
      ),
    ); 
  }

  Container tillage(BuildContext context) {
    return Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration:  BoxDecoration(
                  // border: Border.all(width: 1, color: Theme.of(context).colorScheme.secondary),
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/photos/Netflix.png'),
                        widthSpace(3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Netflix', fontSize: 15 , textColor: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.w700),
                            customText(text: 'Monthly', fontSize: 12, textColor: Theme.of(context).colorScheme.surface),
                            customText(text: 'Renew 06 May', fontSize: 12, textColor: Theme.of(context).colorScheme.surface),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        customText(text: '\$330', fontSize: 14, textColor: Theme.of(context).colorScheme.surface),
                        Icon(Icons.arrow_forward_ios, size: 14, color: Theme.of(context).colorScheme.surface)

                      ],
                    )

                  ],
                ),
              );
  }

  GestureDetector tabButton(String text, IconData icon) {
    return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Icon(
                                icon,
                                color: Colors.white,
                                size: 18,
                                
                              ),
                              widthSpace(2),
                              customText(
                                  text: text, textColor: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      
                      ),
                  );
  }

  Padding subscribeDetails(String amount, String details) {
    return Padding(
                padding: const EdgeInsets.only(top: 20, left: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        customText(text: amount, fontSize: 24, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.center),
                        heightSpace(1),
                        customText(text: details, fontSize: 10, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.center)
                      ],  
                    ),
                  ),
                ),
              );
  }        
  Padding rowScroll() {
    return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            width: MediaQuery.of(context).size.width * 0.43,
            height: MediaQuery.of(context).size.width * 0.17,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                'assets/images/img/music.png',      
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Column(
                  children: [
                        customText(text: 'Apple Music', fontSize: 9, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.start),
                        customText(text: '\$170', fontSize: 15, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.start),
                        customText(text: '2 Days Left', fontSize: 7, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.start),
                    
                  ],
                ),
              )
              ],
            ),
          ),
        );
  }
}






