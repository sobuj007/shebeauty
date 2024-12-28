import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appColors.dart';

class SingelDescription extends StatefulWidget {
  final item;
  const SingelDescription({this.item, super.key});

  @override
  State<SingelDescription> createState() => _SingelDescriptionState();
}

class _SingelDescriptionState extends State<SingelDescription> {
  var allcon = Get.put(AllinfoController());
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print("args");
    print(widget.item);
    return Scaffold(body: Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Column(
          children: [
            Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
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
                              widget.item.img ?? "",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      color: const Color.fromARGB(60, 100, 99, 99),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name.toString().toUpperCase(),
                      style: AppFonts.fontH2semi(AppColors.themeColer),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Admin Description: ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      allcon
                          .getCategoryDescriptionById(
                              int.parse(widget.item.categoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Description: ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.item.description.toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),

                    /***************************** Steps *********************** */
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Steps : ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      allcon
                          .getSubcategorystep(
                              int.parse(widget.item.subcategoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Necessary Product : ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      allcon
                          .getSubcategorynecessaryproduct(
                              int.parse(widget.item.subcategoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'After Services Instruction : ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      allcon
                          .getSubcategoryafterservicesinstruction(
                              int.parse(widget.item.subcategoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Provider Guideline : ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      allcon
                          .getSubcategoryproviderguideline(
                              int.parse(widget.item.subcategoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Customer Guideline : ',
                      style: AppFonts.fontH6semi(AppColors.themeBlack),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      allcon
                          .getSubcategorycustomerguideline(
                              int.parse(widget.item.subcategoryId.toString()))
                          .toString(),
                      style: AppFonts.fontH7regular(AppColors.themeBlack),
                    ),

                    //                 HtmlWidget(''' <div class="menu-container">
                    //     <div class="menu">
                    //         <div class="menu-title">Services</div>
                    //         <ol>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">Web Development</div>
                    //                 <div class="menu-subtitle">Building responsive and modern websites.</div>
                    //             </li>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">Mobile App Development</div>
                    //                 <div class="menu-subtitle">Creating user-friendly mobile applications.</div>
                    //             </li>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">Cloud Services</div>
                    //                 <div class="menu-subtitle">Scalable and secure cloud solutions.</div>
                    //             </li>
                    //         </ol>
                    //     </div>

                    //     <div class="menu">
                    //         <div class="menu-title">Features</div>
                    //         <ul>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">Responsive Design</div>
                    //                 <div class="menu-subtitle">Optimized for all devices and screen sizes.</div>
                    //             </li>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">Cross-Platform Support</div>
                    //                 <div class="menu-subtitle">Works seamlessly across different platforms.</div>
                    //             </li>
                    //             <li class="menu-item">
                    //                 <div class="menu-description">High Performance</div>
                    //                 <div class="menu-subtitle">Fast and efficient user experience.</div>
                    //             </li>
                    //         </ul>
                    //     </div>
                    // </div> ''')
                  ],
                ),
              ]),
            ),
          ],
        ),
      );
    }));
  }
}
