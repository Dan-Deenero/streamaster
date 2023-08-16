import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/features/presentation/widgets/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( 
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),  
      builder: (context, child) {
        return Streamaster();
      },
    ),
  );
}


class Streamaster extends StatefulWidget {
  const Streamaster({super.key});

  @override
  State<Streamaster> createState() => _StreamasterState();
}

class _StreamasterState extends State<Streamaster> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return OverlaySupport.global(
      child: FlutterSizer(builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: router,
        );
      })
    );
  }
}


