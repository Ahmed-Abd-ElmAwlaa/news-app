import 'package:flutter/material.dart';
import 'package:news_app/ui/home/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          color: Color(0xFF39A552),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(24) ,
              bottomLeft:Radius.circular(24)
            )
          )
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF39A552),
            primary:const Color(0xFF39A552)
        ),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName : (_)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName
    );
  }
}




