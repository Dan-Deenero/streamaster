import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/features/presentation/widgets/theme_provider.dart';

ThemeProvider _themeProvider = ThemeProvider();

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
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

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

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

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Future<String> _getUsername() async {
      final docRef =
          FirebaseFirestore.instance.collection("users").doc(user.uid);

      DocumentSnapshot snapshot = await docRef.get();

      return snapshot.get('username');
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            heightSpace(5),
            // Profile avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/photos/s1.png',
              ),
            ),

            heightSpace(5),
            FutureBuilder<String>(
                future: _getUsername(),
                builder: (context, snapshot) {
                  return customText(
                      text: snapshot.data.toString(),
                      fontSize: 16,
                      textColor: AppColors.purple,
                      textAlignment: TextAlign.center);
                }),

            customText(
                text: user.email.toString(),
                fontSize: 12,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlignment: TextAlign.center),

            const SizedBox(height: 32),

            // Settings ListTiles
            GestureDetector(
              onTap: () {
                router.go(AppRoutes.profile);
              },
                child: customListTIle(
                    'Edit Profile',
                    Theme.of(context).colorScheme.surface,
                    Icons.person_outlined,
                    false,
                    'dee')),

            heightSpace(2),
            customListTIle(
                'Notifcations',
                Theme.of(context).colorScheme.surface,
                Icons.notifications_outlined,
                false,
                'dee'),

            heightSpace(2),

            // Dark mode switch
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.primary,
                title: Text('Dark Mode',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface)),
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.surface,
                ),
                trailing: Switch(
                  activeColor: AppColors.purple,
                  value: themeProvider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    // final provider = Provider.of<ThemeProvider>(context, listen: false);
                    themeProvider.toggleTheme(value);
                  },
                ),
              ),
            ),
            heightSpace(2),

            customListTIle('Security', Theme.of(context).colorScheme.surface,
                Icons.security, false, 'dee'),
            heightSpace(2),
            GestureDetector(
              onTap: () {
                signUserOut();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.primary,
                  title: const Text('Logout',
                      style: TextStyle(color: AppColors.purple)),
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container customListTIle(
      String text, Color color, IconData icon, bool? witch, dynamic val) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.primary,
        title: Text(text, style: TextStyle(color: color)),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
