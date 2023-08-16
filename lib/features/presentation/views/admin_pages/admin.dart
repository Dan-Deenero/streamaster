import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamaster/features/presentation/views/profile/settings.dart';
import 'package:streamaster/features/presentation/widgets/app_textformfield.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/features/presentation/widgets/theme_provider.dart';
import 'package:streamaster/home/scrap.dart';
import 'package:streamaster/utils/helpers/validators.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

ThemeProvider _themeProvider = ThemeProvider();

class _AdminPageState extends State<AdminPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  
   static final search = TextEditingController();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Center(child: Text('Home Page',)),
    const Center(child: Text('subscription Page',)),
    const Center(child: Text('Explore Page', )),
    const Center(child: Text('Settings Page',)),  
  ];
  var currentPage = DrawerSections.dashboard;

   @override
  void dispose() {
    _themeProvider.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeProvider.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
  
  final themeProvider = Provider.of<ThemeProvider>(context);
  var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const Center(child: Text('Home Page',));
    } else if (currentPage == DrawerSections.contacts) {
      container = const Center(child: Text('contact page',));
    } else if (currentPage == DrawerSections.events) {
      container = const Center(child: Text('events Page',));
    } else if (currentPage == DrawerSections.notes) {
      container = const Center(child: Text('notes Page',));
    } else if (currentPage == DrawerSections.settings) {
      container = const Center(child: Text('settings Page',));
    } else if (currentPage == DrawerSections.notifications) {
      container = const Center(child: Text('notifications Page',));
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = const Center(child: Text('privacy Page',));
    } else if (currentPage == DrawerSections.send_feedback) {
      container = const Center(child: Text('feedback Page',));
    }
    return  Scaffold(
      backgroundColor:   Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        // title: Center(child: Text("Rapid Tech")),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Switch(
              activeColor: AppColors.formcolorv,
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                    // final provider = Provider.of<ThemeProvider>(context, listen: false);  
                    themeProvider.toggleTheme(value);
                },  
              ),
          )
        ],
      ),
      // floatingActionButtonLocation: Floati ngActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomTextFormField(     
                hintText: 'email',
                textEditingController: search,
                validator: stringValidation,
              ),
              )
            );
          } ,
          backgroundColor: AppColors.purple,
          foregroundColor: Theme.of(context).colorScheme.surface,
          child: const Icon(Icons.add),
          
        ),
      ),
      body: container,
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavBarItem(String image, String image2, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {       
            _selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SvgPicture.asset(
              _selectedIndex == index ? image2: image,
              width: 28,
              height: 28,
            ),
          
        ),
      );
    }

    Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          const Padding(
          padding: EdgeInsets.only(bottom: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.logout,
                  size: 20,
                  color: AppColors.purple,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.purple,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[600] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}


class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    Future<String> _getUsername() async {
      final docRef = FirebaseFirestore.instance.collection("users").doc(user.uid);

      DocumentSnapshot snapshot = await docRef.get();

      return snapshot.get('username');
    }
    return Container(
      color: AppColors.purple,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/photos/s1.png'),
              ),
            ),
          ),
          FutureBuilder<String>(
              future: _getUsername(),
              builder: (context, snapshot) {
                return customText(
                  text: snapshot.data.toString(), 
                  fontSize: 16, 
                  textColor: Theme.of(context).colorScheme.background,
                  textAlignment: TextAlign.center
                );
              }
            ),
          customText(
            text: user.email.toString(), 
            fontSize: 12, 
            textColor: Theme.of(context).colorScheme.background,
            textAlignment: TextAlign.center
          ),
        ],
      ),
    );
  }
}







