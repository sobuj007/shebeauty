import 'package:flutter/material.dart';
import 'package:shebeauty/utils/appColors.dart';

import '../appFonts.dart';

class CustomAppbar extends StatelessWidget {
  String? title;
  CustomAppbar({this.title, super.key});

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
        title: Text(title.toString(),style: AppFonts.fontH3regular(AppColors.themeWhite),),
      );
  }
}
