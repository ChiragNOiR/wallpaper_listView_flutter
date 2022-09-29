import 'dart:convert';

import 'package:build_6_wallpaper_app/data/provider/image_provider.dart';
import 'package:build_6_wallpaper_app/data/style/app_style.dart';
import 'package:build_6_wallpaper_app/ui/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color primaryColor = const Color(0xFFFFFFE0);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageDataProvider(),
      child: MaterialApp(
        title: "Home Page",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: GoogleFonts.dmSans().fontFamily,
            scaffoldBackgroundColor: AppStyle.primaryColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
                toolbarTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ))),
        initialRoute: "dashboard",
        routes: {
          "dashboard": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
