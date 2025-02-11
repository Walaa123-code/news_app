import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.blackColor
      ),
        centerTitle: true,
      backgroundColor: AppColors.whiteColor
    ),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24black,
          headlineLarge: AppStyles.bold16black,
          headlineMedium: AppStyles.medium14black
      )
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
      indicatorColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
  iconTheme: IconThemeData(
  color: AppColors.whiteColor),
        backgroundColor: AppColors.blackColor
    ),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24white,
        headlineLarge: AppStyles.bold16white,
        headlineMedium: AppStyles.medium14white
      )
  );
}