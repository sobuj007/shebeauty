import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/splash_page.dart';

abstract class AppRoutes{
  AppRoutes._();
  static const  spalsh=_Path.Splash;

}




abstract class _Path{
  _Path._();

  static const Splash="/splash";

}

class APpPageRoutes{
  APpPageRoutes._();

  static const INITPage=_Path.Splash;
  static final routes=[
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.spalsh,
    page:()=> Splash(),
    transition: Transition.cupertino),
  
    
  ];
}