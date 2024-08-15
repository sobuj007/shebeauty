
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/category/Controllers/getAllinfocontoller.dart';
import 'package:shebeauty/category/Model/getAllinfoData.dart';
import 'package:shebeauty/category/Screens/SubCategory.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appApis.dart';
import '../../utils/custom widget/CustomAppbar.dart';

class AppCategory extends StatefulWidget {
  final catedata;

  const AppCategory({ required this.catedata ,super.key});

  @override
  State<AppCategory> createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
 
   final AllinfoController con=Get.find();
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
            child: Obx(
              () {
                 if (con.categories == null) {
          return Center(child: CircularProgressIndicator());
        }

        if (con.categories!.isEmpty) {
          return Center(child: Text('No categories available'));
        }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount:con.categories!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cate=con.categories![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AppSubCategory(cat_id: cate.id,)));
                        }),
                        child: Container(
                        height: 16.h,
                        width: 25.w,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Container(
                                  // width: 200,
                                  height: 8.h,
                                  width: 10.w,
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                  AppAppis.makeimgUrl(cate.image),
                                  ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  cate.name
                                      .toString()
                                      .toUpperCase(),
                                  style: AppFonts.fontH7semi(Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )));
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
