import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ghore_Parlor/auth/Controllers/adscobntoller.dart';
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/cart/Screens/Cart.dart';
import 'package:Ghore_Parlor/dashboard/Screens/man.dart';
import 'package:Ghore_Parlor/dashboard/Screens/woman.dart';
import 'package:Ghore_Parlor/profile/Screens/Profile.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/sharedpref.dart';
import 'package:sizer/sizer.dart';

import '../../auth/Controllers/storecontoller.dart';
import '../../category/Controllers/getAllinfocontoller.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List pagelist = [Woman(), Man(), MyCart(), Profile()];

  int selectPageIndex = 0;
  final Usercontoller ucon = Get.put(Usercontoller());
  final AdsController adsController = Get.put(AdsController());
  final AllinfoController controller = Get.put(AllinfoController());
  final StorProfileController storeController =
      Get.put(StorProfileController());

  @override
  Widget build(BuildContext context) {
    ucon.getinfo();
    adsController.fetchData();
    //  controller.fetchData();
    //  storeController.fetchData();
    return Obx(() {
      return SafeArea(
        child: Scaffold(
            body: SafeArea(
              child: selectPageIndex == 0 || selectPageIndex == 1
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Welcome, ${(ucon.getUser() ?? {})['name'].toString()}",
                                style: AppFonts.fontH4regular(
                                    AppColors.themeColer),
                              ),
                              Icon(
                                Icons.notifications,
                                color: AppColors.themeColer,
                              )
                            ],
                          ),
                        ),
                        Container(
                          //height: 22.h,
                          height: 19.h,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                height: 18.h,
                                width: 100.w,
                                child: (adsController.adslist.isEmpty)
                                    ? Center(child: CircularProgressIndicator())
                                    : Container(
                                        height: 19.h,
                                        child: adsController.adslist.isNotEmpty
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.h,
                                                    vertical: 1.h),
                                                child: Swiper(
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        image: DecorationImage(
                                                          image:
                                                              CachedNetworkImageProvider(
                                                                  adsController
                                                                      .adslist[
                                                                          index]
                                                                      .image),
                                                          fit: BoxFit.fill,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    );
                                                  },
                                                  autoplay: true,
                                                  duration: 1000,
                                                  autoplayDelay: 8000,
                                                  itemCount: adsController
                                                      .adslist.length,
                                                  viewportFraction: 1,
                                                  scale: 0.9,
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ),
                              )),
                              Positioned(
                                bottom: 1,
                                child: SizedBox(),
                                // child: Padding(
                                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                //   child: Center(
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       children: [
                                //         Container(
                                //           width: 77.w,
                                //           decoration: BoxDecoration(
                                //               color: Colors.white,
                                //               borderRadius: BorderRadius.circular(15)),
                                //           child: TextField(
                                //             controller: serachController,
                                //             decoration: InputDecoration(
                                //                 contentPadding: EdgeInsets.symmetric(
                                //                     horizontal: 2.0, vertical: 1.0),
                                //                 prefixIcon: Icon(Icons.search),
                                //                 border: OutlineInputBorder(
                                //                   borderRadius: BorderRadius.circular(15),
                                //                 )),
                                //           ),
                                //         ),
                                //         Card(
                                //             shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(15)),
                                //             child: IconButton(
                                //                 onPressed: () {
                                //                   //showpopup(context);
                                //                 },
                                //                 icon: Icon(Icons.sort)))
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ),
                            ],
                          ),
                        ),
                        pagelist[selectPageIndex]
                      ],
                    )
                  : pagelist[selectPageIndex],
            ),
            bottomNavigationBar: bottomnab()

            //  BottomNavigationBar(
            //   currentIndex: selectPageIndex,
            //   selectedItemColor: AppColors.themeColer,
            //   selectedFontSize:12.sp,
            //   unselectedItemColor: Colors.black54,
            //   onTap: (value) {
            //     selectPageIndex = value;
            //     setState(() {});
            //   },
            //   items: [
            //     BottomNavigationBarItem(icon: Icon(Icons.woman), label: "Woman",),
            //     BottomNavigationBarItem(icon: Icon(Icons.man), label: "Man"),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.shopping_cart), label: "Wishlist"),
            //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            //   ],
            // )
            // Container(width: MediaQuery.of(context).size.width,
            // child: ,
            // ),
            ),
      );
    });
  }

  ads() {
    return Obx(() {
      if (adsController.adslist.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Container(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              //var ad = adscon.adslist[index];
              print("Image");
              print(adsController.adslist[index].image.toString());
              return Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            adsController.adslist[index].image,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width);

              // return Image.network(
              //   // "https://via.placeholder.com/288x188",
              //   "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
              //   fit: BoxFit.fill,
              // );
            },
            autoplay: true,
            duration: 1000,
            autoplayDelay: 8000,
            itemCount: adsController.adslist.length,
            viewportFraction: 1,
            scale: 0.9,
          ),
        );
      }
    });
  }

  bottomnab() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: GNav(
            // rippleColor: Colors.blueAccent, // tab button ripple color when pressed
            //  hoverColor: AppColors.themeColer, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(
                color: AppColors.themeimgbg, width: .2), // tab button border
            // tabBorder: Border.all(color: AppColors.themeColer, width: 1), // tab button border
            //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 100), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            //color: Colors.grey[800], // unselected icon color
            activeColor: AppColors.bgColer, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: AppColors.themeColer
                .withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            selectedIndex: selectPageIndex, // navigation bar padding
            onTabChange: (v) {
              selectPageIndex = v;
              setState(() {});
            },
            tabs: [
              GButton(
                icon: LineIcons.female,
                text: 'Woman',
              ),
              GButton(
                icon: LineIcons.male,
                text: 'Man',
              ),
              GButton(
                icon: LineIcons.shoppingBag,
                text: 'Cart',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ]),
      );
}
