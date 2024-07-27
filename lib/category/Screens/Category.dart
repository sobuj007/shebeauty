
import 'package:flutter/material.dart';
import 'package:shebeauty/category/Screens/SubCategory.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/custom widget/CustomAppbar.dart';

class AppCategory extends StatefulWidget {
  const AppCategory({super.key});

  @override
  State<AppCategory> createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
  List itemsCategory=["beautytreatment.png","foot.png","haircutting.png","makeup.png","manicure.png","massage.png","wax.png","woman.png"];
  List itemsCategoryName=["Treatment","foot","haircutting","makeup","manicure","massage","wax","woman"];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: "Category",
          ),
          Container(
            height: MediaQuery.of(context).size.height * .88,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [category(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  category(context) {
    return Container(
      height: MediaQuery.of(context).size.height*.80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AppSubCategory(cat: itemsCategoryName[index],)));
                    }),
                    child: Container(
                            height: 16.h,
                                      width:25.w,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Container(
                                      // width: 200,
                                      height: 8.h,
                                      width:10.w,
                                      child: Image(image: AssetImage("assets/imgs/${itemsCategory[index]}",),fit: BoxFit.contain,),
                                      //height: MediaQuery.of(context).size.height * .01,
                                                   ),Text(itemsCategoryName[index].toString().toUpperCase(),style: AppFonts.fontH7semi(Colors.black),),
                                 ]
                ))))));
              },
            ),
          ),
        ],
      ),
    );
  }
}
