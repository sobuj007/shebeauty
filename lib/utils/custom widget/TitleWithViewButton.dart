import 'package:Ghore_Parlor/dashboard/Screens/nearmeall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/provider/Screens/myprovider2.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../category/Screens/Category.dart';
import '../../provider/Screens/providerAll.dart';

class TitleWithViewButton extends StatefulWidget {
  final title;
  final route;
  final routeData;
  TitleWithViewButton({this.title, this.routeData, this.route, super.key});

  @override
  State<TitleWithViewButton> createState() => _TitleWithViewButtonState();
}

class _TitleWithViewButtonState extends State<TitleWithViewButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title.toString(),
              style: AppFonts.fontH4normal(AppColors.themeColer)),
          SizedBox(),
          TextButton(
              onPressed: () {
                print(widget.routeData);
                if (widget.route == 'c') {
                  Get.toNamed('/category',
                      arguments: {"gender": widget.routeData});
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => AppCategory(catedata: widget.routeData,)));
                } else if (widget.route == 'p') {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ProviderAll()));
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => NearMeAll()));
                }
              },
              child: Text(
                applng.getLang(9),
                style: TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}
