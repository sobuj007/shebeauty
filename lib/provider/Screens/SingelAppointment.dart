import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/provider/Model/allproviderDataModel.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/Customratings.dart';

class SingelAppointment extends StatefulWidget {
  final item;
  const SingelAppointment({this.item,super.key});

  @override
  State<SingelAppointment> createState() => _SingelAppointmentState();
}

class _SingelAppointmentState extends State<SingelAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
           Container(
                    height: 25.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.themeborder),
                        borderRadius: BorderRadius.circular(0)),
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                    child: Container(
                      height: 20.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                items[0].img_url,
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                        child: Container(color: const Color.fromARGB(60, 100, 99, 99),),
                    ),
                  ),
               
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Appointment"),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Time"),
                          Text("${DateTime.now()}".toString()),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
