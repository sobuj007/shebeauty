import 'package:Ghore_Parlor/auth/Controllers/storecontoller.dart';
import 'package:Ghore_Parlor/provider/Controllers/ProductContorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../model/HistoryModel.dart';
import '../review/ReviewRatings.dart';

class ItemDetailTodayPage extends StatelessWidget {
  final item;

  ItemDetailTodayPage({required this.item});

  var allinfoController = Get.put(AllinfoController());
  var procon = Get.put(AllProductController());
  var storecon = Get.put(StorProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Item Details',
            style: AppFonts.fontH4semi(AppColors.themeWhite),
          ),
          backgroundColor: AppColors.themeColer,
          iconTheme: IconThemeData(
              color: AppColors
                  .themeWhite // Change the color of the back arrow here
              ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: item.order.items2.length,
                    itemBuilder: (BuildContext context, int index) {
                      var itemdata = item;
                      print(item);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddReviewScreen(
                                        agentid:
                                            itemdata.serviceProduct2.agentId,
                                        productid: itemdata.serviceProduct2.id,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 1.w),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: .2.w, color: AppColors.themeborder),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text('Order ID: ${item.id}', style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 8),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Text('Product',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text(
                                  //             procon
                                  //                 .getProductNameById(
                                  //                     itemdata.serviceProductId)
                                  //                 .toString(),
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //         Text('Date :',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text(itemdata.reqOrderDate.toString(),
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //         Text('Store :',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text(
                                  //             storecon.getStoreNameByAgentId(
                                  //                         itemdata.vendorId) ==
                                  //                     null
                                  //                 ? "N/A"
                                  //                 : storecon
                                  //                     .getStoreNameByAgentId(
                                  //                         itemdata.vendorId)
                                  //                     .toString(),
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //         //    Text('Category', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                                  //         //     Text('${allinfoController.getCategoryNameById(int.parse(itemdata.serviceProduct2.categoryId)).toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                                  //         //  Text('Service Price', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                                  //         //     Text('${itemdata.servicePrice.toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                                  //         //    Text('Product Price', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                                  //         //     Text('${itemdata.productPrice.toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                                  //       ],
                                  //     ),
                                  //     Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Text('time',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text('${itemdata.userreqtime}',
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //         Text('Service',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text(
                                  //             '${itemdata.serviceQuantity.toString()}',
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //         Text('Product',
                                  //             style: AppFonts.fontH7regular(
                                  //                 AppColors.themeBlack)),
                                  //         Text(
                                  //             '${itemdata.productQuantity.toString()}',
                                  //             style: AppFonts.fontH6bold(
                                  //                 AppColors.themeBlack)),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
