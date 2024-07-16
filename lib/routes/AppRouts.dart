import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/auth/Screens/login_page.dart';
import 'package:shebeauty/category/Screens/Category.dart';
import 'package:shebeauty/category/Screens/SubCategory.dart';
import 'package:shebeauty/dashboard/Screens/layout.dart';
import 'package:shebeauty/provider/Screens/Allprovider.dart';
import 'package:shebeauty/provider/Screens/singelProvider.dart';
import 'package:shebeauty/splash_page.dart';

abstract class AppRoutes{
  AppRoutes._();
  static const  spalsh=_Path.Splash;
  static const  login=_Path.Login;
  static const  layout=_Path.Layout;
  static const  appcategory=_Path.Appcategory;
  static const  appsubcategory=_Path.AppSubCategory;
   static const  allprovider=_Path.AllProvider;
 static const appsingelprovider=_Path.AppsingelProvider;

}




abstract class _Path{
  _Path._();

  static const Splash="/splash";
  static const Login="/login";
  static const Layout="/layout";
  static const Appcategory="/category";
  static const AllProvider="/allprovider";
   static const AppSubCategory="/subcategory";
 static const AppsingelProvider="/singelprovider";

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
      
    /********************************* login ******************** */
    GetPage(
    name: AppRoutes.login,
    page:()=> Login(),
    transition: Transition.cupertino),
  
    /********************************* Layout ******************** */
    GetPage(
    name: AppRoutes.layout,
    page:()=> Layout(),
    transition: Transition.cupertino),
  
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.appcategory,
    page:()=> AppCategory(),
    transition: Transition.cupertino),
  
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.appsubcategory,
    page:()=> AppSubCategory(),
    transition: Transition.cupertino),
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.allprovider,
    page:()=> AllProvider(selectedBody: [],),
    transition: Transition.cupertino),
  
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.appsingelprovider,
    page:()=> SingelProvider(item:[]),
    transition: Transition.cupertino),
  
    
  ];
}