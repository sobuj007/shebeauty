import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

mixin AppFonts {
  static const fontFamilyName = 'Poppins';

  static double splashtitle =20.sp;
  static double h1 =18.sp;
  static double h2 = 16.sp;
  static double h3 = 15.sp;
  static double h4 = 13.sp;
  static double h5 = 12.sp;
  static double h6 = 10.sp;
  static double h7 = 8.sp;
  static double h8 = 6.sp;
 /********************************************************** H1 **************************** */
static  fontSplashtitle(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.splashtitle,
        fontWeight: FontWeight.w200,
        color: c);
  }
  static  custom(c,f,fw) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: f,
        fontWeight: fw,
        color: c);
  }
 /********************************************************** H1 **************************** */
static  fontH1light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.w200,
        color: c);
  }

static  fontH1regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.w300,
        color: c);
  }

static  fontH1normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.normal,
        color: c);
  }

 static fontH1semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.w500,
        color: c);
  }

 static fontH1black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.w800,
        color: c);
  }

 static fontH1bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h1,
        fontWeight: FontWeight.w600,
        color: c);
  }

 /********************************************************** H2 **************************** */
static  fontH2light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.w200,
        color: c);
  }

 static fontH2regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.w500,
        color: c);
  }

 static fontH2normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.w400,
        color: c);
  }

 static fontH2semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.w600,
        color: c);
  }

 static fontH2black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH2bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h2,
        fontWeight: FontWeight.bold,
        color: c);
  }

 /********************************************************** H3 **************************** */
static  fontH3light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.w200,
        color: c);
  }

static  fontH3regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH3normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.normal,
        color: c);
  }

static  fontH3semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.w600,
        color: c);
  }

static fontH3black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH3bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h3,
        fontWeight: FontWeight.bold,
        color: c);
  }


 /********************************************************** H4 **************************** */
static  fontH4light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.w200,
        color: c);
  }

static  fontH4regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH4normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.normal,
        color: c);
  }

static  fontH4semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.w600,
        color: c);
  }

static  fontH4black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH4bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h4,
        fontWeight: FontWeight.bold,
        color: c);
  }


 /********************************************************** H5 **************************** */
static  fontH5light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.w200,
        color: c);
  }

 static fontH5regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH5normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.normal,
        color: c);
  }

 static fontH5semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.w600,
        color: c);
  }

 static fontH5black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH5bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h5,
        fontWeight: FontWeight.bold,
        color: c);
  }



 /********************************************************** H6 **************************** */
 static fontH6light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w200,
        color: c);
  }

 static fontH6regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH6normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.normal,
        color: c);
  }

 static fontH6semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w600,
        color: c);
  }

 static fontH6black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH6bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h6,
        fontWeight: FontWeight.bold,
        color: c);
  }


 /********************************************************** H7 **************************** */
static  fontH7light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.w200,
        color: c);
  }

 static fontH7regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH7normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.normal,
        color: c);
  }

 static fontH7semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.w600,
        color: c);
  }

 static fontH7black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH7bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h7,
        fontWeight: FontWeight.bold,
        color: c);
  }


 /********************************************************** H8 **************************** */
 static fontH8light(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.w200,
        color: c);
  }

 static fontH8regular(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.w300,
        color: c);
  }

 static fontH8normal(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.normal,
        color: c);
  }

 static fontH8semi(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.w600,
        color: c);
  }

 static fontH8black(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.w700,
        color: c);
  }

 static fontH8bold(c) {
    return TextStyle(
        fontFamily: fontFamilyName,
        fontSize: AppFonts.h8,
        fontWeight: FontWeight.bold,
        color: c);
  }

















}
