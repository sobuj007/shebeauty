import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/auth/Controllers/loginController.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool ischeck = false;
  bool isPassview = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  applng.getLang(0),
                  style: AppFonts.fontSplashtitle(AppColors.applogo),
                ),
              ),
            ),
              SizedBox(
              height: 2.h,
            ),
            Text(
              applng.getLang(1),
              style: AppFonts.fontH3semi(Colors.black),
            ),
            
        SizedBox(
              height: 2.h,
            ),
            
            /**************************************** usename field ********************************** */
            TextField(
              controller: username,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  label: Text(applng.getLang(2)),
                  labelStyle: AppFonts.fontH5normal(AppColors.themeBlack),
                  hintText: "example@gmail.com",
                  hintStyle: AppFonts.fontH4regular(AppColors.themehint),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.themeColer))),
            ),
            SizedBox(
              height: 2.h,
            ),
            /**************************************** password field ********************************** */
            TextField(
              controller: password,
              obscureText: isPassview,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: isPassview
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                       
                        isPassview = !isPassview;
                      });
                    },
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  label: Text(applng.getLang(3)),
                  labelStyle: AppFonts.fontH5normal(AppColors.themeBlack),
                  hintText: "******",
                  hintStyle: AppFonts.fontH5regular(AppColors.themehint),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.themeColer))),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: Container(
                        width: 24.0,
                        height: 24.0,
                        child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: ischeck,
                            onChanged: (v) {
                              ischeck = !ischeck;
                              setState(() {});
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      applng.getLang(5),
                      style: AppFonts.fontH6normal(AppColors.themeBlack),
                    )
                  ],
                ),
                Text(
                  applng.getLang(4),
                  style: AppFonts.fontH5normal(AppColors.themeBlack),
                ),
              ],
            ),
              SizedBox(
              height: 2.8.h,
            ),
            /************* login button ******************* */
            GestureDetector(
              onTap: (){
               
                LoginContoller().logins(username.text, password.text,context);


                // Get.toNamed('/layout');
              },
              child: Container(
                width: 100.w,
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.themeColer,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  applng.getLang(10).toString().toUpperCase(),
                  style: AppFonts.fontH3bold(AppColors.themeWhite),
                ),
              ),
            ),Expanded(child: SizedBox()),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                applng.getLang(11).toString(),
                style: AppFonts.fontH6regular(AppColors.themeBlack),
              ),
              SizedBox(width: 1.w,),
              GestureDetector(
                onTap: (){
                  Get.offNamed('/register');
                },
                child: Text(
                  applng.getLang(12).toString(),
                  style: AppFonts.fontH4bold(AppColors.themeBlack),
                ),
              ),
            ],)
          ],
        ),
      )),
    );
  }
}
