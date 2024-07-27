import 'package:flutter/material.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../category/Screens/Category.dart';


class TitleWithViewButton extends StatefulWidget {
  String? title;
  String? route;
  TitleWithViewButton({this.title, this.route, super.key});

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
                print(widget.route);
                if (widget.route == 'c') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AppCategory()));
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
