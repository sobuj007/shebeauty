import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../profile/Screens/locationselection.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';
import '../Controllers/nearMeController.dart';

class NearMeAll extends StatelessWidget {
  NearMeAll({super.key});
  final ServiceProductNearMeController nearMeController =
      Get.put(ServiceProductNearMeController());
  var allcon = Get.put(AllinfoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        CustomAppbar(
          title: "Near me",
        ),
        Expanded(
          child: neaarMe(context),
        )
      ],
    )));
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

        if (nearMeController.error.isNotEmpty) {
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

        return Container(
          width: MediaQuery.of(context).size.width,
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                // ),
                // scrollDirection: Axis.horizontal,
                itemCount: nearMeController.nearProductData.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = nearMeController.nearProductData[index];
                  return GestureDetector(
                    onTap: () {
                      print("product");
                      print(product.toJson());

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.themeWhite),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                product.name.toString(),
                                                style: AppFonts.fontH6semi(
                                                    AppColors.themeBlack),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.themeWhite),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              product.description.toString(),
                                              style: AppFonts.fontH7normal(
                                                  AppColors.themeBlack),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            RatingBarIndicator(
                                              rating: double.parse(product
                                                  .averageRating
                                                  .toString()),
                                              itemCount: 1,
                                              itemSize: 18.0,
                                              direction: Axis.horizontal,
                                              unratedColor: Colors.grey,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              '${product.averageRating.toString()} ',
                                              style: AppFonts.fontH6semi(
                                                  AppColors.themeColer),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.themeWhite),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Category: " +
                                                  allcon
                                                      .getCategoryNameById(
                                                          int.parse(product
                                                              .categoryId
                                                              .toString()))
                                                      .toString(),
                                              style: AppFonts.fontH7semi(
                                                  AppColors.themeBlack),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Sub-Category: " +
                                                  allcon
                                                      .getSubcategoryNameById(
                                                          int.parse(product
                                                              .subcategoryId
                                                              .toString()))
                                                      .toString(),
                                              style: AppFonts.fontH7normal(
                                                  AppColors.themeBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
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
          ),
        );
      });
    }
  }
}
