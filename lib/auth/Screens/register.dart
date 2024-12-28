import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/loginController.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  bool ischeck = false;
  bool isPassview = true;
  bool isPassview2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image(
                    image: AssetImage('assets/2.png'),
                    fit: BoxFit.contain,
                    width: 30.w,
                  )),
                ],
              ),
              SizedBox(
                height: 5.h,
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
                controller: fullname,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    label: Text(applng.getLang(37)),
                    labelStyle: AppFonts.fontH5normal(AppColors.themeBlack),
                    hintText: "jhon deo",
                    hintStyle: AppFonts.fontH4regular(AppColors.themehint),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.themeColer))),
              ),
              SizedBox(
                height: 2.h,
              ),
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
              //*****************************8 confirm passs */
              TextField(
                controller: confirmpass,
                obscureText: isPassview2,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isPassview2
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isPassview2 = !isPassview2;
                        });
                      },
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    label: Text(applng.getLang(39)),
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
                        applng.getLang(40),
                        style: AppFonts.fontH6normal(AppColors.themeBlack),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.8.h,
              ),
              /************* login button ******************* */
              GestureDetector(
                onTap: () {
                  if (fullname.text.isEmpty ||
                      username.text.isEmpty ||
                      password.text.isEmpty) {
                    AppStyle.snackbar('warning', "field can't be empty");
                  } else {
                    if (password.text == confirmpass.text) {
                      if (ischeck != true) {
                        AppStyle.snackbar(
                            'warning', " please check the trems condtions");
                      } else {
                        LoginContoller().register(fullname.text, username.text,
                            password.text, confirmpass.text, context);
                      }
                    } else {
                      AppStyle.snackbar('warning',
                          "password and confirm password not match !");
                    }
                  }

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
                    applng.getLang(12).toString().toUpperCase(),
                    style: AppFonts.fontH3bold(AppColors.themeWhite),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    applng.getLang(11).toString(),
                    style: AppFonts.fontH6regular(AppColors.themeBlack),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed('/login');
                    },
                    child: Text(
                      applng.getLang(10).toString(),
                      style: AppFonts.fontH4bold(AppColors.themeBlack),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
