import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_theme.dart';


void main(){
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
       // CategoryDetails.routeName: (context) => CategoryDetails(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
