import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/provider/Model/allproviderDataModel.dart';
import 'package:shebeauty/routes/AppRouts.dart';
import 'package:shebeauty/utils/appLanguage.dart';
import 'package:sizer/sizer.dart';

AppLanguage applng= AppLanguage();
List<Item> wishListItem =[];
List<Item> CartItem =[];


void main() {
  runApp(const SheBeauty());
}
class SheBeauty extends StatelessWidget {
  const SheBeauty({super.key});
  

  @override
  Widget build(BuildContext context) {
   return Sizer(builder: (context,oriantation,screenType)=>  GetMaterialApp(
      initialRoute: APpPageRoutes.INITPage,
      getPages: APpPageRoutes.routes,
     
    ));
  }
}