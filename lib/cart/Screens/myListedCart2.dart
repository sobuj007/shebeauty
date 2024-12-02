import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/Customratings.dart';
import 'package:sizer/sizer.dart';

import '../../order/paymentpage.dart';
import '../../provider/Model/allproviderDataModel.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';
import '../Controllers/cartCOntroller.dart';

class MyListedCart2 extends StatefulWidget {
  const MyListedCart2({super.key});

  @override
  State<MyListedCart2> createState() => _MyListedCart2State();
}

class _MyListedCart2State extends State<MyListedCart2> {
  var allinfoController = Get.put(AllinfoController());
  var _items2 = [];
  //var cartController.items = [];
  String _selectedLocation = 'All';
  double _selectedRating = 0.0;
  String _selectedBodyPart = 'All';
  String _selectedTime = 'All';
  String _searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
  }
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppbar(
              title: "My Cart",
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 78.w,
            //         height: 5.8.h,
            //         child: TextField(
            //           decoration: InputDecoration(
            //             contentPadding:
            //                 EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
            //             hintText: 'Search...',
            //             border: OutlineInputBorder(
            //                 borderSide:
            //                     BorderSide(width: 1, color: AppColors.themeColer),
            //                 borderRadius: BorderRadius.circular(15)),
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide:
            //                     BorderSide(width: 1, color: AppColors.themeColer),
            //                 borderRadius: BorderRadius.circular(15)),
            //             focusedBorder: OutlineInputBorder(
            //                 borderSide:
            //                     BorderSide(width: 1, color: AppColors.themeColer),
            //                 borderRadius: BorderRadius.circular(15)),
            //             hintStyle: AppFonts.fontH4regular(AppColors.themehint),
            //           ),
            //           style: AppFonts.fontH4regular(AppColors.themeBlack),
            //           onChanged: (query) {
            //             setState(() {
            //               _searchQuery = query;
            //              // _applyFilters();
            //             });
            //           },
            //         ),
            //       ),
            //       Card(
            //         child: IconButton(
            //           icon: Icon(Icons.filter_list),
            //           onPressed: () => _showFilterDialog(context),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Flexible(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  child: Obx(() {
                    if (cartController.items.isEmpty) {
                      return Center(
                        child: Text(
                          "Your Listed Cart is Empty",
                          style: AppFonts.fontH5semi(AppColors.themeColer),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: cartController.items.length,
                      itemBuilder: (context, index) {
                        // return ListTile(
                        //   title: Text(cartController.items[index].name),
                        //   subtitle: Text(cartController.items[index].description),
                        //   trailing: Text(cartController.items[index].rating.toString()),
                        // );

                        return GestureDetector(
                          onLongPress: () {
                            _showdeleteWarning(
                                context,
                                cartController.items[index].name,
                                cartController.items[index].id);
                          },
                          child: Container(
                            height: 40.w,
                            width: 100.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.themeborder),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 1.h),
                            child: Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            cartController.items[index].img
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            60, 100, 99, 99),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 58.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      cartController
                                                          .items[index].name,
                                                      style:
                                                          AppFonts.fontH5semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Column(
                                                      children: [
                                                        RatingBarIndicator(
                                                          rating: double.parse(
                                                              cartController
                                                                  .items[index]
                                                                  .item
                                                                  .averageRating
                                                                  .toString()),
                                                          itemCount: 1,
                                                          itemSize: 18.0,
                                                          direction:
                                                              Axis.horizontal,
                                                          unratedColor:
                                                              Colors.grey,
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                        ),
                                                        Text(
                                                          cartController
                                                              .items[index]
                                                              .item
                                                              .averageRating
                                                              .toString(),
                                                          style: AppFonts
                                                              .fontH7semi(AppColors
                                                                  .themeColer),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Provider Gender : " +
                                                      cartController
                                                          .items[index]
                                                          .item
                                                          .gender
                                                          .toString(),
                                                  style: AppFonts.fontH7normal(
                                                      AppColors.themeBlack),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "S.Price : " +
                                                          cartController
                                                              .items[index]
                                                              .item
                                                              .sprice
                                                              .toString(),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      "P.Price : " +
                                                          cartController
                                                              .items[index]
                                                              .item
                                                              .pprice
                                                              .toString(),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Date : " +
                                                          cartController
                                                              .items[index]
                                                              .selectedDate,
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      "Time : " +
                                                          cartController
                                                              .items[index]
                                                              .selectedTime,
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                // Rattings(
                                                //   rate: cartController.items[index]
                                                //       .rating
                                                //       .toString(),
                                                // )
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Text(
                                                //     cartController.items[index].category,
                                                //     style: AppFonts.fontH7semi(
                                                //         AppColors.themeBlack),
                                                //     maxLines: 2,
                                                //     overflow: TextOverflow.ellipsis,
                                                //   ),
                                                // Text(
                                                //     cartController.items[index].subcategory,F
                                                //     style: AppFonts.fontH7semi(
                                                //         AppColors.themeBlack),F
                                                //     maxLines: 2,
                                                //     overflow: TextOverflow.ellipsis,
                                                //   ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.viewappointment,
                                                  arguments: cartController
                                                      .items[index]);
                                            },
                                            child: Container(
                                              height: 5.h,
                                              width: 35.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color: AppColors.themeColer,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                applng.getLang(35),
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
                          ),
                        );
                      },
                    );
                  })),
            ),
          ],
        ),
        bottomNavigationBar: Obx(() {
          if (cartController.items.isEmpty) {
            return SizedBox();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.w),
            child: Container(
              height: 10.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total"),
                      Text(cartController.calculateTotalPrice().toString())
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PaymentPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.themeColer,
                          borderRadius: BorderRadius.circular(15)),
                      width: 100.w,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Checkout now",
                          style: AppFonts.fontH5semi(AppColors.themeWhite),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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

  void _showdeleteWarning(BuildContext context, name, id) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Delete Item ',
          style: AppFonts.fontH5semi(AppColors.themeBlack),
        ),
        content: Text('Are you sure you want to Delete $name?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog if the user cancels
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              print(id.toString());
              cartController.removeItem((id));
              cartController.saveCartItems();
              // wcon.saveWishlistToPreferences();
              cartController.items;
              Get.back(); // Dismiss the dialog after logging out
            },
            child:
                Text('Yes', style: AppFonts.fontH5semi(AppColors.themeColer)),
          ),
        ],
      ),
    );
  }
  // void _applyFilters() {
  //   setState(() {
  //     cartController.items = items.where((item) {
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
