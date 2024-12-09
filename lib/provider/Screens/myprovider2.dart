import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/provider/Model/allProductModel.dart';
import 'package:sizer/sizer.dart';

import '../../category/Controllers/getAllinfocontoller.dart';
import '../../main.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appApis.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar2.dart';
import '../Controllers/ProductContorller.dart';

class MyProvider2 extends StatelessWidget {
  final AllinfoController con = Get.find();
  var controller = Get.put(AllProductController());
  var _filteredItems = <Products>[].obs;
  var _selectedLocation = 'All'.obs();

  var _selectedBodyPart = 'All'.obs();
  var _selectedTime = 'All'.obs();
  var arg = {}.obs();

  var searchQuery = ''.obs;
  // RxList for selected genders and ratings
  var _selectedGender = ['Both', 'Male', 'Female'].obs;
  var _selectedRating = [1.0, 2.0, 3.0, 4.0, 5.0].obs;

  // RxString for single selected value (example)
  var selectedGender = 'Both'.obs;
  var selectedRating = 1.0.obs;

  // Function to update selected gender
  void updateSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  // Function to update selected rating
  void updateSelectedRating(double rating) {
    selectedRating.value = rating;
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchProducts();
    var argsData = Get.arguments;

    final id = argsData?['subid'];
    final body = argsData?['bodypart'];
    print("this is" + id.toString());

    return Scaffold(
        body: Column(children: [
      CustomAppbar2(
        title: "All provider",
      ),
      myserach(controller, context),
      Expanded(child: Obx(() {
        if (id.toString().isNotEmpty &&
            controller.isAllProductsChecked.value == false) {
          controller.filterBySubcategory(id);
        }
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.filteredList.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          _filteredItems = controller.filteredList;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                var product = _filteredItems[index];
                return Container(
                  height: 23.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColors.themeborder),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 22.h,
                          width: 26.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    product.img ?? "${AppAppis.demoimg}",
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(60, 100, 99, 99),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 54.w,
                                      child: Text(
                                        product.name ?? "",
                                        style: AppFonts.fontH5semi(
                                            AppColors.themeBlack),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Column(
                                      children: [
                                        RatingBarIndicator(
                                          rating: calculateAverageRating(
                                              product.reviewRatings),
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
                                          '${calculateAverageRating(product.reviewRatings).toString()} ',
                                          style: AppFonts.fontH6semi(
                                              AppColors.themeColer),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 44.w,
                                  height: 3.5.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          product.description ?? "",
                                          style: AppFonts.fontH7normal(
                                              AppColors.themeBlack),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 4.h,
                                  width: 58.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: "Provider's Gender : ",
                                              style: AppFonts.fontH7regular(
                                                AppColors.themeBlack,
                                              ),
                                              children: [
                                            TextSpan(
                                              text: product.gender
                                                  .toString()
                                                  .toUpperCase(),
                                              style: AppFonts.fontH7bold(
                                                  const Color.fromARGB(
                                                      221, 26, 1, 1)),
                                            )
                                          ])),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "S:Price : ",
                                          style: AppFonts.fontH7semi(
                                              AppColors.themeBlack),
                                          children: [
                                            TextSpan(
                                                text: product.sprice,
                                                style: AppFonts.fontH5semi(
                                                    AppColors.themeColer))
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "P: Price : ",
                                          style: AppFonts.fontH7semi(
                                              AppColors.themeBlack),
                                          children: [
                                            TextSpan(
                                                text: product.pprice,
                                                style: AppFonts.fontH5semi(
                                                    AppColors.themeColer))
                                          ]),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 36.w,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        con
                                                .getCategoryNameById(int.parse(
                                                    product.categoryId
                                                        .toString()))!
                                                .toUpperCase() ??
                                            "",
                                        style: AppFonts.fontH7semi(
                                            AppColors.themeBlack),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        con
                                                .getSubcategoryNameById(
                                                    int.parse(product
                                                        .subcategoryId
                                                        .toString()))!
                                                .toUpperCase() ??
                                            "",
                                        style: AppFonts.fontH7semi(
                                            AppColors.themeBlack),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.appsingelprovider,
                                      arguments: _filteredItems[index]);
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10)),
                                    color: AppColors.themeColer,
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: .5.h),
                                    child: Text(
                                      applng.getLang(14),
                                      style: AppFonts.fontH6semi(
                                          AppColors.themeWhite),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
      }))
    ]));
  }

  // Function to calculate the average rating
  double calculateAverageRating(reviewRatings) {
    if (reviewRatings.isEmpty) return 0.0;

    double sum = reviewRatings.fold(
        0.0, (sum, review) => sum + double.parse(review.rating.toString()));
    return sum / reviewRatings.length;
  }

  myserach(controller, context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 78.w,
            height: 5.8.h,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                hintText: 'Search...',
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.themeColer),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.themeColer),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.themeColer),
                    borderRadius: BorderRadius.circular(15)),
                hintStyle: AppFonts.fontH4regular(AppColors.themehint),
              ),
              style: AppFonts.fontH4regular(AppColors.themeBlack),
              onChanged: (v) {
                controller.filterItemsQuery(v);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _showFilterDialog(context);
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.sort,
                color: AppColors.themeColer,
              ),
            )),
          )
        ],
      ),
    );
  }

  var h2l = false.obs;
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                applng.getLang(44),
                style: AppFonts.fontH5semi(AppColors.themeBlack),
              ),
              IconButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          content: Obx(() {
            return Container(
              height: 33.h,
              child: Column(
                children: [
                  SizedBox(height: 2.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(applng.getLang(43)),
                      Checkbox(
                        value: controller.isAllProductsChecked.value,
                        onChanged: (v) {
                          controller.toggleAllProducts(v!);
                          Get.back();
                          _filteredItems.refresh();
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          applng.getLang(41),
                          style: AppFonts.fontH7semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: DropdownButton<double>(
                          value: selectedRating.value,
                          underline: SizedBox(),
                          isExpanded: true,
                          items: _selectedRating.map((double value) {
                            return DropdownMenuItem<double>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value.toString(),
                                  style:
                                      AppFonts.fontH6semi(AppColors.themeBlack),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedRating.value = newValue!;
                            controller.applyRatingFilter(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: .5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          applng.getLang(42),
                          style: AppFonts.fontH7semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedGender.value,
                          underline: SizedBox(),
                          isExpanded: true,
                          items: _selectedGender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value,
                                  style:
                                      AppFonts.fontH6semi(AppColors.themeBlack),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedGender.value = newValue!;
                            controller.updateSelectedGender(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: .5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sort by Price:",
                        style: AppFonts.fontH7semi(AppColors.themeBlack),
                      ),
                      GestureDetector(
                        onTap: () {
                          h2l.value = !h2l.value;
                          controller.sortByservicePrice(isHighToLow: h2l.value);
                        },
                        child: Text(
                          h2l.value ? 'High to Low' : 'Low to High',
                          style: AppFonts.fontH6semi(AppColors.themeBlack),
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 8.w),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Container(
                  //       height: 5.h,
                  //       width: 35.w,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: AppColors.themeColer,
                  //       ),
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "Apply",
                  //         style: AppFonts.fontH6semi(AppColors.themeWhite),
                  //       ),
                  //    ),
                  // ),
                  //  )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
