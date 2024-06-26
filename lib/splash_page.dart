import 'package:flutter/material.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appConstant.dart';
import 'package:shebeauty/utils/appFonts.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Center(child: Text(AppConstant.appName,style: AppFonts.fontH8semi(AppColors.themeBlack),)),
      Text(AppConstant.appName,style: AppFonts.fontH1semi(AppColors.themeBlack),)
    ],))
    );
  }
}