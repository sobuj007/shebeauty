import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AppThemes on GetxController {
  final isDarkMode = false.obs;
  final isLanguage = false.obs;
  toggoleTheme() {
    isDarkMode.value != isDarkMode;
    Get.isDarkMode != true
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }
}
