import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shebeauty/routes/AppRouts.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:shebeauty/utils/custom%20widget/CustomAppbar.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Profile",style:AppFonts.fontH5normal(AppColors.themeColer)),IconButton(onPressed: (){
                Get.toNamed(AppRoutes.notification);
              }, icon: Icon(Icons.notifications))],),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 0.h),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 48,
                    backgroundColor: AppColors.themeColer,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.themeColer,
                        backgroundImage:  CachedNetworkImageProvider(
                              
                                  "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg"),),
                    ),
                       
                       
                      
                  
                    SizedBox(width: 4.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "john Deo",
                            style: AppFonts.fontH5semi(AppColors.themeColer),
                          ),
                          Text(
                            "johndeo@gmail.com",
                            style: AppFonts.fontH6semi(AppColors.themeBlack),
                          ),
                          Text(
                            "1234567890",
                            style: AppFonts.fontH6regular(AppColors.themeBlack),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Divider(height: .5 ,color:AppColors.themeColer,),
            ),
            //************************************* settings *****************************
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.settings),SizedBox(width: 2.h,) ,Text("Settings",style: AppFonts.fontH5regular(AppColors.themeBlack),)
              ],),
            ),
            SizedBox(height: 1.h,),
                //************************************* location *****************************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.location_city),SizedBox(width: 2.h,) ,Text("Locations",style: AppFonts.fontH5regular(AppColors.themeBlack),)
              ],),
            ),
            SizedBox(height: 1.h,),
                //************************************* newz *****************************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.newspaper),SizedBox(width: 2.h,) ,Text("News",style: AppFonts.fontH5regular(AppColors.themeBlack),)
              ],),
            ),
            SizedBox(height: 1.h,),
                //************************************* Trems and Policy *****************************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.policy),SizedBox(width: 2.h,) ,Text("Trems and Policy",style: AppFonts.fontH5regular(AppColors.themeBlack),)
              ],),
            ),
            SizedBox(height: 1.h,),
                //************************************* Logout *****************************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.logout),SizedBox(width: 2.h,) ,Text("Logout",style: AppFonts.fontH5regular(AppColors.themeBlack),)
              ],),
            ),
            
            ],),
          )

          ],
        ),
      ),
    );
  }
}
