import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamaster/features/presentation/views/profile/settings.dart';
import 'package:streamaster/home/scrap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Scrap(),
    const Center(child: Text('Explore Page', )),
    const Center(child: Text('Settings Page',)),  
    ProfileSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:   Theme.of(context).colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Hello world"),
              )
            );
          } ,
          backgroundColor: AppColors.purple,
          foregroundColor: Theme.of(context).colorScheme.surface,
          child: const Icon(Icons.add),
          
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        
        padding: const EdgeInsets.symmetric(vertical: 5),
        notchMargin: 5.0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildNavBarItem(FontAwesome.house_chimney, 0),
            buildNavBarItem(FontAwesome.folder, 1), 
            buildNavBarItem( FontAwesome.bookmark, 2),
            buildNavBarItem(FontAwesome.users_gear, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {       
            _selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Icon(
              icon,
              color: _selectedIndex == index ? AppColors.purple : Theme.of(context).colorScheme.surface,
            )
          
        ),
      );
    }
}









