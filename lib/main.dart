import 'package:exemple/pages/core/catalog_screen.dart';
import 'package:exemple/pages/core/order_traking.dart';
import 'package:exemple/pages/core/profile_page.dart';
import 'package:exemple/pages/core/restaurant.dart';
import 'package:exemple/pages/welcome.dart';
import 'package:exemple/themes.dart';
import 'package:exemple/utils/user_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:exemple/pages/auth/login.dart';
import 'package:flutter/services.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:get/get.dart';

import 'models/salads.dart';
import 'pages/core/commande.dart';
import 'pages/auth/in_up.dart';
import 'pages/auth/login_facebook.dart';
import 'pages/auth/logup.dart';
import 'firebase_options.dart';
const d_red = const Color(0xFFE9717D);
const g_grey = const Color(0xFF64DD17);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(GetMaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
          title: title,
          home: WelcomePage(),
        ),
      ),
    );
  }
}