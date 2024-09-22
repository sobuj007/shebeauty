
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:Ghore_Parlor/main.dart';
// import 'package:Ghore_Parlor/provider/Screens/SingelAppointment.dart';
// import 'package:Ghore_Parlor/utils/appColors.dart';
// import 'package:Ghore_Parlor/utils/appFonts.dart';
// import 'package:sizer/sizer.dart';

// import '../../utils/custom widget/CustomAppbar.dart';
// import 'SingelDescription.dart';
// import 'Singelprofile.dart';

// class SingelProvider extends StatefulWidget {
// final item;
//   const SingelProvider({this.item,super.key});

//   @override
//   State<SingelProvider> createState() => _SingelProviderState();
// }

// class _SingelProviderState extends State<SingelProvider> {
//   PageController controller = PageController(initialPage: 0);
//   int selectpage = 0;
//     final args = Get.arguments;

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//       children: [
//         CustomAppbar(
//           title: args.name.toString(),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               //************************Appointment */
//               GestureDetector(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Appointment",style: AppFonts.fontH6semi(AppColors.themeBlack),),
//                     ),
//                     selectpage == 0
//                         ? Container(
//                             width: 80,
//                             height: 2,
//                             color: AppColors.themeColer,
//                           )
//                         : SizedBox()
//                   ],
//                 ),
//                 onTap: (() {
//                   controller.jumpToPage(0);
//                 }),
//               ),
//               GestureDetector(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Description",style: AppFonts.fontH6semi(AppColors.themeBlack),),
//                     ),
//                     selectpage == 1
//                         ? Container(
//                             width: 80,
//                             height: 2,
//                             color: AppColors.themeColer,
//                           )
//                         : SizedBox()
//                   ],
//                 ),
//                 onTap: () {
//                   controller.jumpToPage(1);
//                 },
//               ),
//               GestureDetector(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text("Profile",style: AppFonts.fontH6semi(AppColors.themeBlack),),
//                       ),
//                       selectpage == 2
//                           ? Container(
//                               width: 80,
//                               height: 2,
//                               color: AppColors.themeColer,
//                             )
//                           : SizedBox()
//                     ],
//                   ),
//                   onTap: () {
//                     controller.jumpToPage(2);
//                   }),
//             ],
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.zero,
//             child: PageView(
              
//               controller: controller,
//               onPageChanged: (value) {
//                 setState(() {
//                   selectpage = value;
//                   controller.animateToPage(value,
//                       duration: Duration(seconds: 1), curve: Curves.easeIn);
//                 });
//               },
//               children: [
//                 SingelAppointment(item: args,),
//                 SingelDescription(item: args,),
//                 SingelProfile(item: args,),
//               ],
//             ),
//           ),
//         ),
//       ],
//               ),
//             ),
          
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/provider/Controllers/agentProfileContoller.dart';

import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';
import 'SingelAppointment.dart';
import 'SingelDescription.dart';
import 'Singelprofile.dart';

class SingelProvider extends StatefulWidget {
  final item;

  const SingelProvider({this.item, super.key});

  @override
  State<SingelProvider> createState() => _SingelProviderState();
}

class _SingelProviderState extends State<SingelProvider> {
  PageController controller = PageController(initialPage: 0);

  var agentcontroller = Get.put(AgentProfileController  ());
  int selectpage = 0;
  late final dynamic args;
  var storeProduct=[].obs;

  @override
  void initState() {
    super.initState();
    args = Get.arguments;  // Get the passed data from the previous page
  agentcontroller.fetchAgentProfileData(args.agentId);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomAppbar(
              title: args.name.toString(),  // Display the name or title
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Appointment",
                            style: AppFonts.fontH6semi(AppColors.themeBlack),
                          ),
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
                          child: Text(
                            "Description",
                            style: AppFonts.fontH6semi(AppColors.themeBlack),
                          ),
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
                            child: Text(
                              "Profile",
                              style: AppFonts.fontH6semi(AppColors.themeBlack),
                            ),
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
                    SingelAppointment(item: args),  // Pass args to child widget
                    SingelDescription(item: args),  // Pass args to child widget
                    SingelProfile(item: args),      // Pass args to child widget
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
