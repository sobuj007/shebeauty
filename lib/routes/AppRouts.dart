import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/auth/Screens/login_page.dart';
import 'package:shebeauty/auth/Screens/register.dart';
import 'package:shebeauty/cart/Screens/MyListedCart.dart';
import 'package:shebeauty/cart/Screens/myListedCart2.dart';

import 'package:shebeauty/category/Screens/Category.dart';
import 'package:shebeauty/category/Screens/SubCategory.dart';
import 'package:shebeauty/dashboard/Screens/layout.dart';
import 'package:shebeauty/notification/Screens/NotificationsPage.dart';
import 'package:shebeauty/provider/Screens/Allprovider.dart';
import 'package:shebeauty/provider/Screens/myprovider.dart';
import 'package:shebeauty/provider/Screens/myprovider2.dart';
import 'package:shebeauty/provider/Screens/singelProvider.dart';
import 'package:shebeauty/provider/Screens/viewAppointment.dart';
import 'package:shebeauty/splash_page.dart';

abstract class AppRoutes{
  AppRoutes._();
  static const  spalsh=_Path.Splash;
  static const  login=_Path.Login;
  static const  register=_Path.Register;
  static const  layout=_Path.Layout;
  static const  appcategory=_Path.Appcategory;
  static const  appsubcategory=_Path.AppSubCategory;
   static const  allprovider=_Path.AllProvider;
 static const appsingelprovider=_Path.AppsingelProvider;
 static const myListedCart=_Path.MyListedCart;
 static const myListedCart2=_Path.MyListedCart2;
  static const viewappointment=_Path.ViewAppoinment;
  static const notification=_Path.Notifications;
 
  static const myprovider=_Path.Myprovider;
  static const myprovider2=_Path.Myprovider2;
  static const demo=_Path.Demo;

}




abstract class _Path{
  _Path._();

  static const Splash="/splash";
  static const Login="/login";
  static const Register="/register";
  static const Layout="/layout";
  static const Appcategory="/category";
  static const AllProvider="/allprovider";
   static const AppSubCategory="/subcategory";
 static const AppsingelProvider="/singelprovider";
 static const MyListedCart="/myListedcart";
 static const MyListedCart2="/myListedcart2";
 static const ViewAppoinment="/viewAppoinment";
 static const Notifications="/notification";
 static const Myprovider="/myprovider";
 static const Myprovider2="/myprovider2";
 static const Demo="/demo";


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
      
    /********************************* login ******************** */
    GetPage(
    name: AppRoutes.register,
    page:()=> Register(),
    transition: Transition.cupertino),
  
    /********************************* Layout ******************** */
    GetPage(
    name: AppRoutes.layout,
    page:()=> Layout(),
    transition: Transition.cupertino),
  
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.appcategory,
    page:()=> AppCategory(catedata: [],),
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
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.myListedCart,
    page:()=> MyListedCart(),
    transition: Transition.cupertino),
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.myListedCart2,
    page:()=> MyListedCart2(),
    transition: Transition.cupertino),
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.viewappointment,
    page:()=> ViewAppointment(item: [],),
    transition: Transition.cupertino),
    /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.notification,
    page:()=> NotificationPage(),
    transition: Transition.cupertino),
    /********************************* splash ******************** */
    // GetPage(
    // name: AppRoutes.myprovider,
    // page:()=> MyProvider(),
    // transition: Transition.cupertino),
    // /********************************* splash ******************** */
    GetPage(
    name: AppRoutes.myprovider2,
    page:()=> MyProvider2(),
    transition: Transition.cupertino),

  ];
}