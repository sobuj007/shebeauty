import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/loginController.dart';

import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'package:Ghore_Parlor/routes/AppRouts.dart';
import 'package:Ghore_Parlor/utils/appLanguage.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/Temp.dart';
import 'package:sizer/sizer.dart';

import 'category/Controllers/getAllinfocontoller.dart';
import 'provider/Controllers/ProductContorller.dart';

AppLanguage applng= AppLanguage();
var wishListItem =<Item>[].obs;
var cartListItem =[].obs;
Temp tdata=Temp();
// RxInt countCartItem=CartItem.length.obs;


void main() {
  
     Get.put(AllinfoController());
 
  
  runApp(const SheBeauty());

}
class SheBeauty extends StatelessWidget {
  const SheBeauty({super.key});
  

  @override
  Widget build(BuildContext context) {
   return Sizer(builder: (context,oriantation,screenType)=>  GetMaterialApp(
      initialRoute: APpPageRoutes.INITPage,
      getPages: APpPageRoutes.routes,
      debugShowCheckedModeBanner: false,
     
    ));
  }
}