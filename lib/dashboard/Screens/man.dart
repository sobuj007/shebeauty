import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/dashboard/Controllers/nearMeController.dart';
import 'package:sizer/sizer.dart';

import '../../auth/Controllers/storecontoller.dart';
import '../../category/Controllers/getAllinfocontoller.dart';
import '../../category/Screens/SubCategory.dart';
import '../../main.dart';
import '../../profile/Screens/locationselection.dart';
import '../../provider/Screens/Each Provider/EachProvider.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appApis.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/TitleWithViewButton.dart';

class Man extends StatefulWidget {
  const Man({super.key});

  @override
  State<Man> createState() => _ManState();
}

class _ManState extends State<Man> {
  final AllinfoController controller = Get.put(AllinfoController());
  final StorProfileController storeController =
      Get.put(StorProfileController());
  final ServiceProductNearMeController nearMeController =
      Get.put(ServiceProductNearMeController());

  late Map<String, dynamic> userdata;

  RxMap<String, dynamic> profile = <String, dynamic>{}.obs;
  RxMap<String, dynamic> user = <String, dynamic>{}.obs;
  var token = ''.obs;

  // getinfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userdata = (await Mypref().retrieveDataDynamically())!;
  //   if (userdata != null) {
  //  profile.assignAll(userdata['profile']?? {});
  //   user.assignAll(userdata['user']);
  //   token.value=userdata['token'];
// setState(() {

// });

  // } else {
  //     print("No data found.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // getinfo();
    String selectedGender = 'male';

    // Fetch data when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchData();
      storeController.fetchData();
    });

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TitleWithViewButton(
                  title: applng.getLang(6),
                  route: "c",
                  routeData: selectedGender,
                ),
                /********************** category bloc *************************** */
                Container(
                    height: 14.h,
                    //color: Colors.green,
                    child: Obx(() {
                      if (controller.allinfoModel.value == null) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        // if (categories == null) {
                        //       return Center(child: CircularProgressIndicator());
                        //     }

                        //     if (categories.isEmpty) {
                        //       return Center(child: Text('No categories available for this gender'));
                        //     }
                        //     print('object');
                        //     print(categories);

                        final data =
                            controller.getCategoriesByGender(selectedGender);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length ?? 0,
                          itemBuilder: (context, index) {
                            final category = data[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AppSubCategory(
                                              cat_id: category.id,
                                            )));
                                //  Navigator.push(context,
                                //   MaterialPageRoute(builder: (_) => AppSubCategory(cat_id: category.id,)));
                              },
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
                                              category.image,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          category.name
                                              .toString()
                                              .toUpperCase(),
                                          style:
                                              AppFonts.fontH7semi(Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    })),
                /********************************* provider bloc ************* */
                TitleWithViewButton(
                  title: applng.getLang(7),
                  route: 'p',
                ),
                Obx(() {
                  if (storeController.stores.value == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    // Display the data

                    return Container(
                      height: MediaQuery.of(context).size.height * .18,
                      //color: Colors.green,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: storeController.stores.length > 4
                            ? 3
                            : storeController.stores.length,
                        itemBuilder: (context, index) {
                          var total;
                          //  var total= double.parse(_filteredItems[index].servicePrice!)+double.parse(_filteredItems[index].price!);
//                     if (index < storeController.stores.length) {
//    total = double.parse(profile[index].servicePrice!) + double.parse(storeController.stores[index].price!);
// } else {
//   print('Index out of bounds');
// }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EachProvider(
                                            item: storeController
                                                .stores[index].agentId,
                                          )));
                            },
                            child: Card(
                              color: Colors.blue,
                              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: 38.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          errorListener: (e) {},
                                          storeController.stores[index]
                                                      .coverImage ==
                                                  null
                                              ? "https://softisan.xyz/uploads/category/1725218338--beautytreatment.png"
                                              : AppAppis.storecover +
                                                  storeController.stores[index]
                                                      .coverImage)),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black38,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          storeController
                                              .stores[index].storename!
                                              .toUpperCase(),
                                          style: AppFonts.fontH6semi(
                                              AppColors.themeWhite),
                                        ),
                                        // Expanded(child: SizedBox()),
                                        Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Image(
                                                  height: 4.h,
                                                  width: 4.h,
                                                  image: CachedNetworkImageProvider(
                                                      storeController
                                                                  .stores[index]
                                                                  .logo ==
                                                              null
                                                          ? "https://ghoreparlour.com/uploads/category/1725218338--beautytreatment.png"
                                                          : storeController
                                                              .stores[index]
                                                              .logo),
                                                )))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
                /********************************* near me Bloc ******************* */
                TitleWithViewButton(
                  title: applng.getLang(8),
                ),
                Container(height: 20.h, child: neaarMe(context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  var place = false;
  neaarMe(context) {
    if (place) {
      return Center(
        child: Text("Please update your Profile"),
      );
    } else {
      return Obx(() {
        if (nearMeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (nearMeController.error.isNotEmpty ||
            nearMeController.nearProductData.value == []) {
          return Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CityLocationFilter()));
                  },
                  child: Text(nearMeController.error.value)));
        }
        if (nearMeController.nearProductData.length == 0) {
          return Center(
              child: Text(
            "Services Not Found for Your Location!",
            style: AppFonts.fontH6regular(AppColors.themeColer),
          ));
        }
        return Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Flexible(
            child: ListView.builder(
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              // ),
              scrollDirection: Axis.horizontal,
              itemCount: nearMeController.nearProductData.length,
              itemBuilder: (BuildContext context, int index) {
                final product = nearMeController.nearProductData[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.appsingelprovider,
                        arguments: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              errorListener: (e) {},
                              product.img == null
                                  ? "https://softisan.xyz/uploads/category/1725218338--beautytreatment.png"
                                  : product.img.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black38,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 3.5.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.themeWhite),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      product.name.toString(),
                                      style: AppFonts.fontH6semi(
                                          AppColors.themeBlack),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
    }
  }
}
