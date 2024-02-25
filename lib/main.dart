import 'package:castify/DI/service_locator.dart';
import 'package:castify/constants/constants.dart';
import 'package:castify/ui/introduction_screen.dart';
import 'package:flutter/material.dart';

void main() {
  initServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: "MR",
            fontSize: 32,
            color: MyColor.whiteColor,
          ),
          displayMedium: TextStyle(
            fontFamily: "SM",
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      home: IntroductionScreen(),
    );
  }
}
