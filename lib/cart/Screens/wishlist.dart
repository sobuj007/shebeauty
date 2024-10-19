import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/provider/Controllers/WishlistController.dart';
import 'package:Ghore_Parlor/provider/Model/agentProfileModel.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/Customratings.dart';
import 'package:sizer/sizer.dart';

import '../../provider/Model/allproviderDataModel.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistController wcon = Get.put(WishlistController());
  final AllinfoController acon = Get.put(AllinfoController());

  var _filteredItems2 = <Products>[].obs;
  String _selectedLocation = 'All';
  double _selectedRating = 0.0;
  String _selectedBodyPart = 'All';
  String _selectedTime = 'All';
  String _searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
    //   _items2=wishListItem;
    // _filteredItems2=wishListItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (wcon.wishlist == null) {
        return Center(child: CircularProgressIndicator());
      }
      if (wcon.wishlist.isEmpty) {
        return Center(
          child: Text(
            "WishList is Empty",
            style: AppFonts.fontH5semi(AppColors.themeColer),
          ),
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CustomAppbar(
          //   title: "All provider",
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   width: 78.w,
                //   height: 5.8.h,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       contentPadding:
                //           EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                //       hintText: 'Search...',
                //       border: OutlineInputBorder(
                //           borderSide:
                //               BorderSide(width: 1, color: AppColors.themeColer),
                //           borderRadius: BorderRadius.circular(15)),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide:
                //               BorderSide(width: 1, color: AppColors.themeColer),
                //           borderRadius: BorderRadius.circular(15)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide:
                //               BorderSide(width: 1, color: AppColors.themeColer),
                //           borderRadius: BorderRadius.circular(15)),
                //       hintStyle: AppFonts.fontH4regular(AppColors.themehint),
                //     ),
                //     style: AppFonts.fontH4regular(AppColors.themeBlack),
                //     onChanged: (query) {
                //       setState(() {
                //         _searchQuery = query;
                //        // _applyFilters();
                //       });
                //     },
                //   ),
                // ),
                // Card(
                //   child: IconButton(
                //     icon: Icon(Icons.filter_list),
                //     onPressed: () => _showFilterDialog(context),
                //   ),
                // ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
              child: ListView.builder(
                // shrinkWrap: true,
                padding: EdgeInsets.zero,

                itemCount: wcon.wishlist.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   title: Text(_filteredItems2[index].name),
                  //   subtitle: Text(_filteredItems2[index].description),
                  //   trailing: Text(_filteredItems2[index].rating.toString()),
                  // );

                  return Container(
                    height: 20.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.themeborder),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                    child: Row(
                      children: [
                        Container(
                          height: 20.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    wcon.wishlist[index].img.toString(),
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            color: const Color.fromARGB(60, 100, 99, 99),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 58.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          wcon.wishlist[index].name.toString(),
                                          style: AppFonts.fontH5semi(
                                              AppColors.themeBlack),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // Rattings(
                                        //   rate: _filteredItems2[index]
                                        //       .rating
                                        //       .toString(),
                                        // )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 58.w,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            wcon.wishlist[index].description
                                                .toString(),
                                            style: AppFonts.fontH7normal(
                                                AppColors.themeBlack),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).paddingOnly(bottom: .5.h),
                                  /************************** gender */
                                  Container(
                                    width: 58.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Provider Gender : " +
                                              wcon.wishlist[index].gender
                                                  .toString(),
                                          style: AppFonts.fontH7normal(
                                              AppColors.themeBlack),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: "P.price ",
                                                  style: AppFonts.fontH7semi(
                                                      AppColors.themeBlack),
                                                  children: [
                                                    TextSpan(
                                                        text: wcon
                                                            .wishlist[index]
                                                            .pprice
                                                            .toString(),
                                                        style:
                                                            AppFonts.fontH5semi(
                                                                AppColors
                                                                    .themeColer))
                                                  ]),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "S.price ",
                                                  style: AppFonts.fontH7semi(
                                                      AppColors.themeBlack),
                                                  children: [
                                                    TextSpan(
                                                        text: wcon
                                                            .wishlist[index]
                                                            .sprice
                                                            .toString(),
                                                        style:
                                                            AppFonts.fontH5semi(
                                                                AppColors
                                                                    .themeColer))
                                                  ]),
                                            ),
                                          ],
                                        )
                                        // Text(
                                        //   "price" + _filteredItems2[index].price,
                                        //   style: AppFonts.fontH4semi(
                                        //       AppColors.themeBlack),
                                        //   maxLines: 2,
                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /************************** Book noe button */
                            Container(
                              width: 63.2.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          acon
                                              .getCategoryNameById(int.parse(
                                                  wcon.wishlist[index]
                                                      .categoryId
                                                      .toString()))
                                              .toString(),
                                          style: AppFonts.fontH7semi(
                                              AppColors.themeBlack),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          acon
                                              .getSubcategoryNameById(int.parse(
                                                  wcon.wishlist[index]
                                                      .subcategoryId
                                                      .toString()))
                                              .toString(),
                                          style: AppFonts.fontH7semi(
                                              AppColors.themeBlack),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.appsingelprovider,
                                          arguments: wcon.wishlist[index]);
                                    },
                                    child: Container(
                                      height: 5.h,
                                      width: 35.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10)),
                                        color: AppColors.themeColer,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        applng.getLang(14),
                                        style: AppFonts.fontH6semi(
                                            AppColors.themeWhite),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }));
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filter Options'),
              IconButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                color: AppColors.themeWhite,
                height: 30.h,
                child: Column(
                  children: [
                    /*************************************************Location******************************** */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 18.w,
                          child: Text(
                            "Location :",
                            style: AppFonts.fontH4semi(AppColors.themeBlack),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 35.w,
                          height: 6.h,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.themeborder),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            underline: SizedBox(),
                            value: _selectedLocation,
                            items: [
                              'All',
                              'Mirpur-1',
                              'bijoy Soroni',
                              'banani',
                              'shamoly',
                              'badda',
                              'Bashundhara R/A'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style:
                                      AppFonts.fontH5semi(AppColors.themeColer),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLocation = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w),
                    /**************************************rating*************************** */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 18.w,
                          child: Text(
                            "Rating :",
                            style: AppFonts.fontH4semi(AppColors.themeBlack),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 35.w,
                          height: 5.h,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.themeborder),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<double>(
                            value: _selectedRating,
                            items: [
                              0.0,
                              0.5,
                              1.0,
                              1.5,
                              2.0,
                              2.5,
                              3.0,
                              3.5,
                              4.0,
                              4.5,
                              5.0
                            ].map((double value) {
                              return DropdownMenuItem<double>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                  style:
                                      AppFonts.fontH5semi(AppColors.themeColer),
                                ),
                              );
                            }).toList(),
                            onChanged: (double? newValue) {
                              setState(() {
                                _selectedRating = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w),
                    /****************************************************body part**************** */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 18.w,
                          child: Text(
                            "Body Part :",
                            style: AppFonts.fontH4semi(AppColors.themeBlack),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 35.w,
                          height: 5.h,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.themeborder),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedBodyPart,
                            items: ['All', 'hand', 'face', 'leg']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                  style:
                                      AppFonts.fontH5semi(AppColors.themeColer),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedBodyPart = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.w),
                    /*********************************************time*************  */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 18.w,
                          child: Text(
                            "Time :",
                            style: AppFonts.fontH4semi(AppColors.themeBlack),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          width: 35.w,
                          height: 5.h,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.themeborder),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedTime,
                            items: ['All', '10.5', '5.30', '8.00']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style:
                                      AppFonts.fontH5semi(AppColors.themeColer),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedTime = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              child: Text('Apply'),
              onPressed: () {
                setState(() {
                  // _applyFilters();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // void _applyFilters() {
  //   setState(() {
  //     _filteredItems2 = items.where((item) {
  //       bool matchesLocation = _selectedLocation == 'All' ||
  //           item.location.contains(_selectedLocation);
  //       bool matchesRating = item.rating >= _selectedRating;
  //       bool matchesBodyPart = _selectedBodyPart == 'All' ||
  //           item.bodypart.contains(_selectedBodyPart);
  //       bool matchesTime =
  //           _selectedTime == 'All' || item.time.contains(_selectedTime);
  //       bool matchesSearchQuery =
  //           item.name.toLowerCase().contains(_searchQuery.toLowerCase());
  //       return matchesLocation &&
  //           matchesRating &&
  //           matchesBodyPart &&
  //           matchesTime &&
  //           matchesSearchQuery;
  //     }).toList();
  //   });
  // }
}
