import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/utils/appColors.dart';

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


  
}