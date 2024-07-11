import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:sizer/sizer.dart';

import '../../provider/Screens/Allprovider.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';

class AppSubCategory extends StatefulWidget {
  const AppSubCategory({super.key});

  @override
  State<AppSubCategory> createState() => _AppSubCategoryState();
}

class _AppSubCategoryState extends State<AppSubCategory> {
  List<String> bodypart = [
    "Eyebrows",
    "Upper lip",
    "Chin",
    "Sideburns",
    "Full face",
    "Underarms",
    "Arms",
    "Legs",
    "Bikini line",
    "Brazilian",
    "Back",
    "Chest",
    "Stomach",
    "Full body"
    
  ];
  List<Map<String, String>> itemData = [
    {"name": "Honey Wax", "img": "honeywax.png"},
    {"name": "Fruit Wax", "img": "friuts.png"},
    {"name": "Pre-Made Wax", "img": "strip.png"},
    {"name": "Cold Soft Wax", "img": "cold.png"},
    {"name": "Warm Hard Wax", "img": "hard.png"},
    {"name": "Warm Soft Wax", "img": "wax.png"},
    // {"name": "Sugar Wax", "img": "sugarwax.png"},
    // {"name": "Sugar Wax", "img": "sugarwax.png"},
    // {"name": "Sugar Wax", "img": "sugarwax.png"},
  ];

  List<String> selectedBodyValue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
      )),
    );
  }

  subcategory(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showpopup(context);
                },
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
                          child: Image(image: AssetImage("assets/imgs/${itemData[index]['img']}",),fit: BoxFit.contain,),
                          //height: MediaQuery.of(context).size.height * .01,
                                       ),Text(itemData[index]['name'].toString().toUpperCase(),style: AppFonts.fontH6semi(Colors.black),),
                     ]
                            ))),)
            );
          },
        ),
      ),
    );
  }

  showpopup(context) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            height: 15.h+(5.h*bodypart.length/2),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Body Part:",
                    style: AppFonts.fontH3semi(AppColors.themeBlack),
                  ),
                  GroupButton(

                    
                    options: GroupButtonOptions(
                      groupingType: GroupingType.wrap,
                      spacing: 5,runSpacing: 5,
                        borderRadius: BorderRadius.circular(5),
                        textPadding: EdgeInsets.symmetric(horizontal: 1.w,vertical: .5.w),
                        selectedColor: Colors.amberAccent,
                        unselectedTextStyle:
                            AppFonts.fontH5semi( Colors.black),
                        selectedTextStyle:
                            AppFonts.fontH5semi( Colors.black)),
                    isRadio: false,
                    onSelected: ((value, index, isSelected) {
                
                      if (isSelected == false) {
                        selectedBodyValue.remove(value);
                      } else {
                        selectedBodyValue.add(value);
                      }
                    }),
                    buttons: bodypart,
                  ),
                 Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              
                               onTap: () {
                                  print(selectedBodyValue);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AllProvider(
                                                selectedBody: selectedBodyValue,
                                              )));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: AppColors.themeColer,borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Search",style: AppFonts.fontH3bold(AppColors.themeWhite),),
                                  ),
                                ))),
                      ],
                    ),
                  
                ],
              ),
            ),
          );
        }));
  }
}
