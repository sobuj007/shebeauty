
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shebeauty/cart/Screens/Cart.dart';
import 'package:shebeauty/dashboard/Screens/man.dart';
import 'package:shebeauty/dashboard/Screens/woman.dart';
import 'package:shebeauty/profile/Screens/Profile.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List pagelist = [Woman(), Man(), MyCart(), Profile()];
  int selectPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: pagelist[selectPageIndex],
        ),
        bottomNavigationBar:bottomnab()
        
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
        );
  }


  bottomnab()=>Padding(
    padding:  EdgeInsets.symmetric(horizontal: 3.w),
    child: GNav(
    // rippleColor: Colors.blueAccent, // tab button ripple color when pressed
    //  hoverColor: AppColors.themeColer, // tab button hover color
    haptic: true, // haptic feedback
    tabBorderRadius: 15, 
    tabActiveBorder: Border.all(color: AppColors.themeimgbg, width: .2), // tab button border
     // tabBorder: Border.all(color: AppColors.themeColer, width: 1), // tab button border
    //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
    curve: Curves.easeOutExpo, // tab animation curves
    duration: Duration(milliseconds: 900), // tab animation duration
    gap: 8, // the tab button gap between icon and text 
    //color: Colors.grey[800], // unselected icon color
    activeColor: AppColors.bgColer, // selected icon and text color
    iconSize: 24, // tab button icon size
    tabBackgroundColor: AppColors.themeColer.withOpacity(0.1), // selected tab background color
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    selectedIndex: selectPageIndex, // navigation bar padding
    onTabChange: (v){
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
    ]
    ),
  );
}
