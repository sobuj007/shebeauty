import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:shebeauty/category/Controllers/getAllinfocontoller.dart';
import 'package:shebeauty/category/Model/getAllinfoData.dart';
import 'package:shebeauty/provider/Screens/myprovider.dart';
import 'package:shebeauty/provider/Screens/myprovider2.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:sizer/sizer.dart';

import '../../provider/Screens/Allprovider.dart';
import '../../utils/appApis.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';

class AppSubCategory extends StatefulWidget {
  final cat_id;
  AppSubCategory({this.cat_id, super.key});

  @override
  State<AppSubCategory> createState() => _AppSubCategoryState();
}

class _AppSubCategoryState extends State<AppSubCategory> {
  var displayedList = [].obs;
  var displayedListBodyPart = [].obs;

  final AllinfoController con = Get.find();

  List selectedBodyValue = <String>[].obs();
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // Filter the list

//    displayedList=allinfo.filterSubcategoriesByName(widget.cat_id.toString());

//   }
//   filtebodypart(id){
//     List<Bodypart> data=con.filterBodypartsByName(id.toString());
//      setState(() {
//       displayedListBodyPart = data.map<String>((bodyPart) => bodyPart.name ?? '').toList();

//      });

//      displayedListBodyPart.isNotEmpty?showpopup(context,id):Future.delayed(Duration.zero, () async {
//  Get.to(MyProvider2(),arguments:{"subcategory":allinfo.subcategories,"bodypart":selectedBodyValue,"subid":id});
// });

//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: "Sub Category",
          ),
          Container(
            height: MediaQuery.of(context).size.height * .88,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [subcategory(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  subcategory(context) {
    return Container(
      height: MediaQuery.of(context).size.height * .80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              if (con.categories == null) {
                return Center(child: CircularProgressIndicator());
              }

              if (con.categories!.isEmpty) {
                return Center(child: Text('No categories available'));
              }
              final data =
                  con.filterSubcategoriesByName(widget.cat_id.toString());
              return data.length != 0
                  ? GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final vdata = data[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: (() {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (_) => AppSubCategory(cat_id: vdata.id,)));
                                  con.filterBodypartsByName(vdata.id.toString())!.isEmpty
                                      ?  Get.to(MyProvider2(), arguments: {
                                      "subcategory": con.subcategories,
                                      "bodypart": '',
                                      "subid": vdata.id
                                    })
                                      : showpopup(context, vdata.id);
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
                                                  vdata.image),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            vdata.name.toString().toUpperCase(),
                                            style: AppFonts.fontH7semi(
                                                Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )));
                      },
                    )
                  : Center(child: Text('No Subcategories available'));
            }),
          ),
        ],
      ),
    );
  }

  // subcategory(context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: GridView.builder(
  //       padding: EdgeInsets.zero,
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 3,
  //             ),
  //             itemCount: displayedList.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     selectedBodyValue=[];
  //                     filtebodypart(displayedList[index].id);
  //                    // showpopup(context);
  //                   },
  //                   child: Card(
  //                     color: Colors.white,
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(4.0),
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             // width: 200,
  //                             height: 7.h,
  //                             width:10.w,
  //                             child: Image(image: CachedNetworkImageProvider(
  //                                 AppAppis.makeimgUrl(displayedList[index].image),
  //                                 ),fit: BoxFit.contain,),
  //                             //height: MediaQuery.of(context).size.height * .01,
  //                                          ),Center(child: Text(displayedList[index].name.toString().toUpperCase(),style: AppFonts.fontH7semi(Colors.black),maxLines: 2,textAlign: TextAlign.center,)),
  //                        ]
  //                               ))),)
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  showpopup(context, id) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Obx(() {
            if (con.categories == null) {
              return Center(child: CircularProgressIndicator());
            }

            if (con.categories!.isEmpty) {
              return Center(child: Text('No Body part available'));
            }
            final data = con.filterBodypartsByName(id.toString());
            var listdata = data;
            return Container(
              // height: 15.h+(5.h*bodypart.length/2),
              height: 30.h + (5.h),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Body Part:",
                      style: AppFonts.fontH4semi(AppColors.themeBlack),
                    ),
                    GroupButton(
                      options: GroupButtonOptions(
                          groupingType: GroupingType.wrap,
                          spacing: 5,
                          runSpacing: 5,
                          borderRadius: BorderRadius.circular(5),
                          textPadding: EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: .5.w),
                          selectedColor: Colors.amberAccent,
                          unselectedTextStyle:
                              AppFonts.fontH7semi(Colors.black),
                          selectedTextStyle: AppFonts.fontH7semi(Colors.black)),
                      isRadio: false,
                      onSelected: ((value, index, isSelected) {
                        if (isSelected) {
                          selectedBodyValue.add(index.toString());
                        } else {
                          selectedBodyValue.remove(index.toString());
                        }
// For debugging purposes
                      }),
                      buttons: data,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Future.delayed(Duration.zero, () async {
                                    Get.to(MyProvider2(), arguments: {
                                      "subcategory": con.subcategories,
                                      "bodypart": selectedBodyValue,
                                      "subid": id
                                    });
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.themeColer,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Search",
                                      style: AppFonts.fontH4bold(
                                          AppColors.themeWhite),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        }));
  }
}
