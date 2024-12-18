import 'package:flutter/material.dart';
import 'package:islamie/home_screen/home_page.dart';
import 'package:islamie/my_theme_data.dart';

void main (){
  runApp(const Islamic());
}

class Islamic extends StatelessWidget{
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}