import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appColors.dart';

class SingelDescription extends StatefulWidget {
  final item;
  const SingelDescription({this.item,super.key});

  @override
  State<SingelDescription> createState() => _SingelDescriptionState();
}

class _SingelDescriptionState extends State<SingelDescription> {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Column(
          children: [
            Expanded(
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
                                  widget.item.image??"",
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                            child: Container(color: const Color.fromARGB(60, 100, 99, 99),),
                        ),
                      ),
                   
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Text(widget.item.name,style: AppFonts.fontH2semi(AppColors.themeColer
                  ),),  Text(widget.item.description.toString()),
                    
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
      ),
    );
  }
}
