import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shorts/Controller/BottomNavigationController.dart';
import 'package:news_shorts/HomePageController.dart';
import 'package:news_shorts/Pages/DemoPage.dart';

import 'Config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    BottomNavController controller = Get.put(BottomNavController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
      home: HomePageController(),
    );
  }
}

