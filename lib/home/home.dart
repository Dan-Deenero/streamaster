import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dynamic_curved_navigation_bar/dynamic_curved_navigation_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:   const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
             const Row(
               children: [
                 Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text('Good evening David!', style: TextStyle(color: Color(0xFFF4F3F3), fontSize: 25, fontWeight: FontWeight.w600),
                  ),
            ),
                 Padding(
                   padding: EdgeInsets.only(top: 50, left: 120),
                   child: Icon(Icons.notifications, color: Color(0xFFF4F3F3),),
                 )
               ],
             ),

            const Padding(
              padding: EdgeInsets.only(top: 20, right: 70),
              child: Text('\$100.00', style: TextStyle(color: AppColors.purple, fontSize: 35, fontWeight: FontWeight.w600),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF222222),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('20',
                              style: TextStyle(color: Colors.white,fontSize: 25)),
                        ),
                        SizedBox(height: 5,),
                        Text('Total', style: TextStyle(color: Colors.white, fontSize: 16),),

                        Text('Subscription', style: TextStyle(color: Colors.white, fontSize: 16),)

                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF222222),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('3',
                              style: TextStyle(color: Colors.white,fontSize: 25)),
                        ),
                        SizedBox(height: 5,),
                        Text('Payments', style: TextStyle(color: Colors.white, fontSize: 16),),

                        Text('This week', style: TextStyle(color: Colors.white, fontSize: 16),)

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 15 ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFF222222),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text('2',
                              style: TextStyle(color: Colors.white,fontSize: 25)),
                        ),
                        SizedBox(height: 5,),
                        Text('Ongoing', style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text('Free trials', style: TextStyle(color: Colors.white, fontSize: 16),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 20, left: 25),
                  child: Text('Upcoming', style: TextStyle(color: Color(0xFFF4F3F3), fontSize: 25, fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 180),
                  child: Text('View All', style: TextStyle(color: Colors.white, fontSize: 17),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,size: 17,),
                )
              ],
            ),
            const HorizontalGridView(),

           const  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 20, left: 25),
                  child: Text('Subscription', style: TextStyle(color: Color(0xFFF4F3F3), fontSize: 25, fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 160),
                  child: Text('View All', style: TextStyle(color: Colors.white, fontSize: 17),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,size: 17,),
                )
              ],
            ),



          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}



class HorizontalGridView extends StatelessWidget {
  const HorizontalGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              width: 150,
              height: 100,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF222222),
              ),
              child:  const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset('assets/images/img/music.png',
                  // width: 15,
                  // height: 15,),

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 50),
                      child: Text('Apple Music', style: TextStyle(color: Colors.white),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('\$150',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('2 days left',  style: TextStyle(color: Colors.white),),
                    )
                  ],
                )
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              width: 150,
              height: 100,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF222222),
              ),
              child:const  Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 50),
                    child: Text('Apple Music', style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('\$150',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('2 days left',  style: TextStyle(color: Colors.white),),
                  )


                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(

              width:150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF222222),
              ),
              child: const  Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 50),
                    child: Text('Apple Music', style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('\$150',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('2 days left',  style: TextStyle(color: Colors.white),),
                  )

                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(

              width:150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF222222),
              ),
              child:const  Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 50),
                    child: Text('Apple Music', style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('\$150',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text('2 days left',  style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(

              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF222222),
              ),
              child: const Column(

                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 50),
                      child: Text('Apple Music', style: TextStyle(color: Colors.white),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('\$150',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('2 days left',  style: TextStyle(color: Colors.white),),
                    )

                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }
}
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {


    return CurvedNavigationBar(

      backgroundColor: Colors.black,
        color:  Colors.grey ,
        buttonBackgroundColor: AppColors.purple,
        index: 2,
        items: const [
             Icon(Icons.home, color: Colors.black, size: 30,),
          Icon(Icons.tv, color: Colors.black,size: 30,),
          Icon(Icons.add, color: Colors.black,size: 30,),
          Icon(Icons.favorite, color: Colors.black,size: 30,),
          Icon(Icons.settings, color: Colors.black,size: 30,)
        ],
        onTap: (index) {
      // Handle item tap

    },

    );

  }
}



