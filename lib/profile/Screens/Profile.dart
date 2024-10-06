import 'package:Ghore_Parlor/profile/tremscondito.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/sharedpref.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:Ghore_Parlor/order/History/HistoryPage.dart';
import 'package:Ghore_Parlor/profile/Screens/editprofile.dart';
import 'package:Ghore_Parlor/profile/Screens/locationselection.dart';
import 'package:Ghore_Parlor/routes/AppRouts.dart';
import 'package:Ghore_Parlor/utils/appApis.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../auth/Controllers/userContoller.dart';
import '../news.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Usercontoller ucon = Get.put(Usercontoller());
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    ucon.getinfo();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile",
                      style: AppFonts.fontH5normal(AppColors.themeColer)),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.notification);
                      },
                      icon: Icon(Icons.notifications))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx((){
print(ucon.profile);
              if(ucon.profile==null){
                return CircularProgressIndicator();
              } else if(ucon.profile.isEmpty){
            return Text("Pleases Update profile from Edit profile!");
              }
              // if (ucon.profile.isEmpty){
              //   return Text("Pleases Update profile from Edit profile!");

              // }
              return    Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 0.h),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.themeColer,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: AppColors.themeColer,
                        backgroundImage: CachedNetworkImageProvider(ucon
                                    .profile.value['img'] ==
                                null
                            ? "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg"
                            : (AppAppis.profileimg + ucon.profile.value['img'])
                                .toString()),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ucon.user['name'] == null
                                ? "john Deo"
                                : ucon.user['name'].toString(),
                            style: AppFonts.fontH5semi(AppColors.themeColer),
                          ),
                          Text(
                            ucon.user['email'] == null
                                ? "johndeo@gmail.com"
                                : ucon.user['email'].toString(),
                            style: AppFonts.fontH6semi(AppColors.themeBlack),
                          ),
                          Text(
                            ucon.profile.value['mobilenumber'].toString() ==
                                    null
                                ? "1234567890"
                                : ucon.profile.value['mobilenumber'].toString(),
                            style: AppFonts.fontH6regular(AppColors.themeBlack),
                          ),
                          Text(
                            ucon.profile.value['address'].toString(),
                            style: AppFonts.fontH6regular(AppColors.themeBlack),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
           
            }),
          SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Divider(
                height: .5,
                color: AppColors.themeColer,
              ),
            ),
            //************************************* settings *****************************
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Editprofile(mobile: ucon.profile.value['mobilenumber'].toString())));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "Edit Profile",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //************************************* location *****************************
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CityLocationFilter()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_city),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "Locations",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //************************************* History *****************************
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HistoryPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.history),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "History",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //************************************* newz *****************************
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>NewsPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.newspaper),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "News",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //************************************* Trems and Policy *****************************
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TermsAndConditionsPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.policy),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "Terms and Policy",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //************************************* Logout *****************************
                  GestureDetector(
                    onTap: () {
                      _showLogoutWarning(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 2.h,
                          ),
                          Text(
                            "Logout",
                            style: AppFonts.fontH5regular(AppColors.themeBlack),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutWarning(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog if the user cancels
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Perform logout and close dialog
              authController.logout();
              Get.back(); // Dismiss the dialog after logging out
            },
            child: Text('Logout',
                style: AppFonts.fontH5semi(AppColors.themeColer)),
          ),
        ],
      ),
    );
  }
}

class AuthController extends GetxController {
  void logout() {
    // Your logout logic here (clearing session, tokens, etc.)
    print("User logged out");
    Mypref().clearSharedPrefs();
    // After logout, navigate to the login screen or landing page
    Get.offAllNamed(
        '/login'); // Redirect to login page (adjust the route as per your project)
  }
}
