import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appConstant.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startTimer(){

    Future.delayed(Duration(seconds: 2)).then((value)=>{
      Get.toNamed("/login")
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Center(child: Text(AppConstant.appName,style: AppFonts.fontH8semi(AppColors.themeBlack),)),
      Text(AppConstant.appName,style: AppFonts.custom(AppColors.themeBlack,24.sp,FontWeight.bold),)
    ],))
    );
  }
}