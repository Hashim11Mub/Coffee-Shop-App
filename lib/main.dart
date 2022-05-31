import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hashim_shop/home/home_screen/MainFoodPage.dart';
import 'package:hashim_shop/home/home_screen/main_home_screen.dart';
import 'package:hashim_shop/home/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: 
       SplashPage(duration: 3,goToPage: WelcomePage(),),
    );
  }
}