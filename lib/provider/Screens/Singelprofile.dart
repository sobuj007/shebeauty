import 'package:flutter/material.dart';
import 'package:shebeauty/main.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/Customratings.dart';
import '../Model/allproviderDataModel.dart';

class SingelProfile extends StatefulWidget {
  final item;
  const SingelProfile({this.item,super.key});

  @override
  State<SingelProfile> createState() => _SingelProfileState();
}

class _SingelProfileState extends State<SingelProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                          Icon(Icons.verified,color: AppColors.themeColer,
                          ),
                          SizedBox(width:5 
                          ,),
                           Text(
                                                        items[0].name.toUpperCase(),
                                                        style: AppFonts.fontH5bold(
                                                            AppColors.themeColer),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                         ],
                       ),
                        Rattings(
                                              rate: items[0].rating.toString(),
                                            ),
                     ],
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(applng.getLang(21),style: AppFonts.fontH6regular(AppColors.themeColer),),
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 1,color: AppColors.themehint)),child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(items[0].available),
                        ),)
                      ],),
                      Column(children: [
                        Text(applng.getLang(28),style: AppFonts.fontH6regular(AppColors.themeColer),),
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 1,color: AppColors.themehint)),child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(items[0].available),
                        ),)
                      ],),
                    ],
                   ),
                /**********************************certificates **************************** */
certificates(context),









                  
              ],
            ),
          )),
    );
  }

  certificates(context){
    return Column(
      children: [
        Text(applng.getLang(29),style: AppFonts.fontH5normal(AppColors.themeColer),),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Flexible(
            child: GridView.builder(
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 5
                  ),
            ),
              itemCount: 6,
               shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.w),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.themeimgbg),
                    child: Center(child: Text("data")),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
