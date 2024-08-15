import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:sizer/sizer.dart';

mixin AppStyle{
 static snackbar(title,messsage)=> Get.snackbar(
              title,
             messsage,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.themeColer,
              colorText: AppColors.themeWhite,
              borderRadius: 10,
              margin: EdgeInsets.all(10),
              duration: Duration(seconds: 3),
            );


 // Function to convert a string to a TimeOfDay object
 static TimeOfDay stringToTime(String timeString) {
  final parts = timeString.split(':');
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
static DateTime stringToDate(String dateString) {
  final parts = dateString.split('/');
  final day = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  final year = int.parse(parts[2]);
  
  // Assuming the current year
 // final currentYear = DateTime.now().year;
  
  return DateTime(year, month, day);

}

static showloader(context)=>showDialog(context: context, builder: (_)=>Container(height: 100.h,width: 100.w,color: AppColors.themeWhite,child: Center(child: CircularProgressIndicator(color: AppColors.themeColer,),),));
}