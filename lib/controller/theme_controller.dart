import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController{

  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  @override
  void onInit(){
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData(){
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  //getters
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

}