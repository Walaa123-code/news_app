import 'package:flutter/material.dart';


class LanguageProvider extends ChangeNotifier{
  String appLanguage="en";
  LanguageProvider(){
    _loadLanguage();
  }
  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('appLanguage') ?? 'en';
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);
  }

}