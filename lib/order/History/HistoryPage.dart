import 'package:Ghore_Parlor/order/model/HistoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sizer/sizer.dart';
import '../../auth/Controllers/storecontoller.dart';
import '../../auth/Controllers/userContoller.dart';
import '../../provider/Controllers/ProductContorller.dart';
import '../HistoryContoller.dart';
import 'itemsDetails.dart';
import 'itemsDetailsToday.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryController historyController = Get.put(HistoryController());
  PageController _pageController = PageController(initialPage: 0);
  var getcon = Get.put(Usercontoller());
  var procon = Get.put(AllProductController());
  var storecon = Get.put(StorProfileController());
  var users;
  final String textToCopy = "Tap to copy this text!";
  var selectpage = 0;
  @override
  void initState() {
    super.initState();

    users = getcon.getUser();

    historyController.fetchHistory(users['id'].toString());
  }

  @override
  Widget build(BuildContext context) {
    // historyController.fetchHistory(users['id'].toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: AppFonts.fontH4semi(AppColors.themeWhite),
        ),
        backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
            color:
                AppColors.themeWhite // Change the color of the back arrow here
            ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabButton("Completed", 0),
              buildTabButton("Pending", 1),
              buildTabButton("Today", 2),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (historyController.hasError.value) {
          return Center(child: Text("Error loading data."));
        }

        return PageView(
          controller: _pageController,
          onPageChanged: (value) {
            selectpage = value;
            setState(() {});
          },
          children: [
            buildOrderList("Completed Orders",
                historyController.historyModel.value.completedOrders),
            buildOrderList("Pending Orders",
                historyController.historyModel.value.pendingOrders),
            buildOrderList("Today's Orders",
                historyController.historyModel.value.todaysOrders),
          ],
        );
      }),
    );
  }

  Widget buildTabButton(String title, int pageIndex) {
    return TextButton(
      onPressed: () {
        selectpage = pageIndex;
        // _pageController.jumpToPage(selectpage);
        _pageController.jumpToPage(selectpage);

        setState(() {});
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors.themeWhite),
          ),
          selectpage == pageIndex
              ? Container(
                  height: .2.h,
                  width: 20.w,
                  color: AppColors.themeWhite,
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget buildOrderList(String title, orders) {
    print("orders$title");
    print(orders);
    if (orders == null || orders.isEmpty) {
      return Center(child: Text("No $title available"));
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        // return Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: .5.h),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         border: Border.all(width: .2.w, color: AppColors.themeborder),
        //         borderRadius: BorderRadius.circular(10)),
        //     child: ListTile(
        //       onTap: () {
        //         title == "Today's Orders"
        //             ? Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (_) => ItemDetailTodayPage(
        //                           item: order,
        //                         )))
        //             : Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (_) => ItemDetailPage(
        //                           item: order,
        //                         )));
        //       },
        //       title: Text("#GPHW" + order.order.id.toString()),
        //       trailing:
        //           Text(order.status), // Customize this based on your order data
        //     ),
        //   ),
        // );
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.w),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: .2.w, color: AppColors.themeborder),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('Order ID: ${item.id}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order: GHP${order.orderId}OD',
                              style:
                                  AppFonts.fontH7normal(AppColors.themeBlack)),
                          Text('Product',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text(
                              procon
                                  .getProductNameById(order.serviceProductId)
                                  .toString(),
                              style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          Text('Date :',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text(order.reqOrderDate.toString(),
                              style: AppFonts.fontH6bold(AppColors.themeBlack)),

                          //     style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          //    Text('Category', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                          //     Text('${allinfoController.getCategoryNameById(int.parse(itemdata.serviceProduct2.categoryId)).toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          //  Text('Service Price', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                          //     Text('${itemdata.servicePrice.toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          //    Text('Product Price', style: AppFonts.fontH7regular(AppColors.themeBlack)),
                          //     Text('${itemdata.productPrice.toString()}', style: AppFonts.fontH6bold(AppColors.themeBlack)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('time',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text('${order.userreqtime}',
                              style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          Text('Service',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text('${order.serviceQuantity.toString()}',
                              style: AppFonts.fontH6bold(AppColors.themeBlack)),
                          Text('Product',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text('${order.productQuantity.toString()}',
                              style: AppFonts.fontH6bold(AppColors.themeBlack)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Store :',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text(
                            storecon.getStoreNameByAgentId(order.vendorId) ==
                                    null
                                ? "N/A"
                                : storecon
                                    .getStoreNameByAgentId(order.vendorId)
                                    .toString(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Cost :',
                              style:
                                  AppFonts.fontH7regular(AppColors.themeBlack)),
                          Text(
                            order.payable.toString() + " Tk",
                            style: AppFonts.fontH5semi(AppColors.themeColer),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          LineIcon.mapMarker(
                            size: 3.h,
                          ),
                          Text(
                            storecon.getStoreAddressByAgentId(order.vendorId) ==
                                    null
                                ? "N/A"
                                : storecon
                                    .getStoreAddressByAgentId(order.vendorId)
                                    .toString(),
                            style: AppFonts.fontH7regular(AppColors.themeBlack),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          LineIcon.mobilePhone(
                            size: 3.h,
                          ),
                          storecon.getStorePhonByAgentId(order.vendorId) == null
                              ? Text("N/A")
                              : GestureDetector(
                                  onLongPress: () {
                                    Clipboard.setData(ClipboardData(
                                      text: storecon
                                          .getStorePhonByAgentId(order.vendorId)
                                          .toString(),
                                    )); // Copy to clipboard
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Copied to clipboard!")),
                                    );
                                  },
                                  child: Text(
                                      storecon
                                          .getStorePhonByAgentId(order.vendorId)
                                          .toString(),
                                      style: AppFonts.fontH7semi(
                                          AppColors.themeBlack)),
                                ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
