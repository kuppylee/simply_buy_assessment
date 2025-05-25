import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplybuy_assesment/screens/bottom_nav_bar.dart';
import 'package:simplybuy_assesment/utilities/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.lightBlackColor, // Match your bottom nav bar color
      systemNavigationBarIconBrightness: Brightness.light, // Adjust icon visibility
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: BottomNavBar()
    );
  }
}

