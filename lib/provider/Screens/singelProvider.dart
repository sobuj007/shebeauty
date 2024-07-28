
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/provider/Screens/SingelAppointment.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/custom widget/CustomAppbar.dart';
import 'SingelDescription.dart';
import 'Singelprofile.dart';

class SingelProvider extends StatefulWidget {
final item;
  const SingelProvider({this.item,super.key});

  @override
  State<SingelProvider> createState() => _SingelProviderState();
}

class _SingelProviderState extends State<SingelProvider> {
  PageController controller = PageController(initialPage: 0);
  int selectpage = 0;
    final args = Get.arguments;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
      children: [
        CustomAppbar(
          title: args.name.toString(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //************************Appointment */
              GestureDetector(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Appointment",style: AppFonts.fontH6semi(AppColors.themeBlack),),
                    ),
                    selectpage == 0
                        ? Container(
                            width: 80,
                            height: 2,
                            color: AppColors.themeColer,
                          )
                        : SizedBox()
                  ],
                ),
                onTap: (() {
                  controller.jumpToPage(0);
                }),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Description",style: AppFonts.fontH6semi(AppColors.themeBlack),),
                    ),
                    selectpage == 1
                        ? Container(
                            width: 80,
                            height: 2,
                            color: AppColors.themeColer,
                          )
                        : SizedBox()
                  ],
                ),
                onTap: () {
                  controller.jumpToPage(1);
                },
              ),
              GestureDetector(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Profile",style: AppFonts.fontH6semi(AppColors.themeBlack),),
                      ),
                      selectpage == 2
                          ? Container(
                              width: 80,
                              height: 2,
                              color: AppColors.themeColer,
                            )
                          : SizedBox()
                    ],
                  ),
                  onTap: () {
                    controller.jumpToPage(2);
                  }),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.zero,
            child: PageView(
              
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  selectpage = value;
                  controller.animateToPage(value,
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
                });
              },
              children: [
                SingelAppointment(item: args,),
                SingelDescription(item: args,),
                SingelProfile(item: args,),
              ],
            ),
          ),
        ),
      ],
              ),
            ),
          
    );
  }
}
