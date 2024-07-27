import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:shebeauty/utils/appLanguage.dart';
import 'package:sizer/sizer.dart';

import '../../utils/custom widget/TitleWithViewButton.dart';

class Woman extends StatefulWidget {
  const Woman({super.key});

  @override
  State<Woman> createState() => _WomanState();
}

class _WomanState extends State<Woman> {
  TextEditingController controller = TextEditingController();
  TextEditingController serachController = TextEditingController();
  List areaitem = [
    "Mirpur",
    "Shamoly",
    "Bonani",
    "Kafrul",
    "Gulshan",
    "Bashundhara",
    "Khilkhet"
  ];
  List cityitem = ["Dhaka", "Chattogram", "Rajshahi", "Syhlet", "Rongpur"];
  List itemsCategory = [
    "beautytreatment.png",
    "foot.png",
    "haircutting.png",
    "makeup.png",
    "manicure.png",
    "massage.png",
    "wax.png",
    "woman.png"
  ];
  List itemsCategoryName = [
    "Treatment",
    "foot",
    "haircutting",
    "makeup",
    "manicure",
    "massage",
    "wax",
    "woman"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 22.h,
              child: Stack(
                children: [
                  Positioned(
                      child:
                          Container(height: 18.h, width: 100.w, child: ads())),
                  Positioned(
                      bottom: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 77.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextField(
                                  controller: serachController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 1.0),
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                      onPressed: () {
                                        showpopup(context);
                                      },
                                      icon: Icon(Icons.sort)))
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                TitleWithViewButton(
                  title: applng.getLang(6),
                  route: "c",
                ),
                /********************** category bloc *************************** */
                Container(
                  height: 14.h,
                  //color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemsCategory.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                                    image: AssetImage(
                                      "assets/imgs/${itemsCategory[index]}",
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  itemsCategoryName[index]
                                      .toString()
                                      .toUpperCase(),
                                  style: AppFonts.fontH7semi(Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /********************************* provider bloc ************* */
                TitleWithViewButton(
                  title: applng.getLang(7),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .18,
                  //color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue,
                  //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 38.w,
                          height: 13.h,
                          decoration: BoxDecoration(
                           // borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
                                ),
                                fit: BoxFit.fill,),
                          ),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,color: Colors.black38,),
                            child: Padding(
                              padding:  EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                                         Text("Womans Doll".toUpperCase(),style: AppFonts.fontH6semi(AppColors.themeWhite),),
                              ],),
                            ),
                           
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /********************************* near me Bloc ******************* */
                TitleWithViewButton(
                  title: applng.getLang(8),
                ),
                neaarMe(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  // showpopup(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: ((context) {
  //         return Container(
  //           height: 300,
  //           color: Colors.amber,
  //           child: Text("data"),
  //         );
  //       }));
  // }

  showpopup(context) {
    showDialog(
        context: context,
        builder: ((context) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 300,
              color: Colors.amber,
              child: Text("data"),
            ),
          );
        }));
  }

  neaarMe(context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 100,
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }

  ads() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black26,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width);

        // return Image.network(
        //   // "https://via.placeholder.com/288x188",
        //   "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
        //   fit: BoxFit.fill,
        // );
      },
      autoplay: true,
      duration: 1000,
      autoplayDelay: 8000,
      itemCount: 10,
      viewportFraction: 1,
      scale: 0.9,
    );
  }
}
