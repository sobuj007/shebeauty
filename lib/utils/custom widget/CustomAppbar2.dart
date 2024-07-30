import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/cart/Screens/MyListedCart.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/routes/AppRouts.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:sizer/sizer.dart';

import '../../cart/Controllers/cartCOntroller.dart';
import '../../cart/Screens/MyListedCart.dart';
import '../appFonts.dart';

class CustomAppbar2 extends StatelessWidget {
  String? title;
  CustomAppbar2({this.title, super.key});
 final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height * .065,
    //   width: MediaQuery.of(context).size.width,
    //   color: Colors.blueAccent,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     child: Row(
    //       children: [
    //         IconButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             icon: Icon(
    //               Icons.arrow_back_ios,
    //               color: Colors.white,
    //             )),
    //         Text(
    //           title.toString(),
    //           style: TextStyle(fontSize: 18, color: Colors.white),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return  AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: AppColors.themeWhite,),onTap: (){Navigator.pop(context);},),
        backgroundColor: AppColors.themeColer,
        title: Text(title.toString().toUpperCase(),style: AppFonts.fontH4regular(AppColors.themeWhite),),
        actions: [
         
          GestureDetector(child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w),
            child: Obx((){
              return Stack(
              children: [
              
                Icon(Icons.shopping_bag,color: AppColors.themeWhite,size: 25.sp,),
                  Positioned(
                  right: 1,
                  child:cartController.items.isEmpty?SizedBox(): CircleAvatar(backgroundColor: Colors.green,radius: 10,child: Center(child:  Text(cartController.items.length.toString(),style: AppFonts.fontH7semi(AppColors.themeBlack),))),),
              ],
            );
            }),
          ),onTap: () {
          Get.offAndToNamed(AppRoutes.myListedCart2);
          },)
        ],
      );
  }
}
