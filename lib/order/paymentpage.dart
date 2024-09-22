import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Ghore_Parlor/cart/Controllers/cartCOntroller.dart';
import 'package:Ghore_Parlor/dashboard/Screens/layout.dart';
import 'package:Ghore_Parlor/order/OrderContoller.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar.dart';
import 'package:sizer/sizer.dart';

import '../utils/appStyle.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var cartItems = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Invoice'),
      // ),
      body: Column(
        children: [
          CustomAppbar(
            title: "Invoice",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: cartItems.items.length,
                itemBuilder: (context, index) {
                  var data = cartItems.items[index];
                  return Card(
                    child: ListTile(
                      leading: Container(
                          width: 15.w, child: Image.network(data.img)),
                      title: Text(data.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'S.Quantity: ${data.selectedServicsQun}',
                                style:
                                    AppFonts.fontH7semi(AppColors.themeBlack),
                              ),
                              Text(
                                'Price: ${data.sprice}',
                                style:
                                    AppFonts.fontH7semi(AppColors.themeBlack),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'P.Quantity: ${data.selectedProductQun}',
                                style:
                                    AppFonts.fontH7semi(AppColors.themeBlack),
                              ),
                              Text(
                                'Price: ${data.pprice}',
                                style:
                                    AppFonts.fontH7semi(AppColors.themeBlack),
                              ),
                            ],
                          ),
                          // Text('Total Product Price: \$${int.parse(data.selectedProductQun) * data.item['productPrice']}'),
                          // Text('Total Service Price: \$${int.parse(data.selectedServicsQun) * data.item['servicePrice']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(cartItems.calculateTotalPrice().toString(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showPaymentModal(
                context,
                cartItems.calculateTotalPrice().toString(),
              );
            },
            child: Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 5.8.h,
                color: AppColors.themeColer,
                child: Text(
                  'Proceed to Payment',
                  style: AppFonts.fontH5semi(AppColors.themeWhite),
                )),
          ),
        ],
      ),
    );
  }

  void _showPaymentModal(BuildContext context, total) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the modal to resize when the keyboard appears
      builder: (context) {
        return PaymentModal();
      },
    );
  }
}

final TextEditingController addressController = TextEditingController();
final TextEditingController notesController = TextEditingController();
final TextEditingController mobile = TextEditingController();

class PaymentModal extends StatefulWidget {
  @override
  _PaymentModalState createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  var cartitemcontoller = Get.put(CartController());
  String paymentMethod = 'Cash on Delivery';

  late List<String> agentIds;
  late List<String> serviceProductIds;
  late List<String> productQuantities;
  late List<String> serviceQuantities;
  late List<String> productPrices;
  late List<String> servicePrices;
  late List<String> selectedSlots;
  late var dates;
  late List<String> reqTime;
  bool res=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, // Adjusts padding for keyboard
      ),
      child: SingleChildScrollView(
        // Wrap content with scroll view
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method',
              style: AppFonts.fontH5semi(AppColors.themeColer),
            ),
            SizedBox(height: 5),
            RadioListTile<String>(
              title: Text(
                'Cash on Delivery',
                style: AppFonts.fontH6semi(AppColors.themeBlack),
              ),
              value: 'Cash on Delivery',
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text(
                'Online Pay',
                style: AppFonts.fontH6semi(AppColors.themeBlack),
              ),
              value: 'Online Pay',
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                labelStyle: AppFonts.fontH6semi(AppColors.themeBlack),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: 'Notes',
                labelStyle: AppFonts.fontH6semi(AppColors.themeBlack),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Mobile',
                labelStyle: AppFonts.fontH6semi(AppColors.themeBlack),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                // Handle the payment and order confirmation logic here
                if (addressController.text.isNotEmpty &&
                    mobile.text.isNotEmpty) {
                  AppStyle.showloader(context);
                  agentIds = cartitemcontoller.getItemsagents();
                  serviceProductIds = cartitemcontoller.getItemIds();
                  productQuantities = cartitemcontoller.getItempquan();
                  serviceQuantities = cartitemcontoller.getItemsquan();
                  productPrices = cartitemcontoller.getItempprice();
                  servicePrices = cartitemcontoller.getItemsprice();
                  selectedSlots = cartitemcontoller.getItemsreqtime();
                  dates = cartitemcontoller.getOrderDate();
                  reqTime = cartitemcontoller.getOrderReqTime();
                  print(dates);

                  Map<String, dynamic> result = convertToJson();
                  print(result);

                  var getOrderId = await MyOrder().storeOrder(result);
                  print(getOrderId);

                  if(res){
                    var t = cartitemcontoller.calculateTotalPrice().toString();
                  submitOrder(getOrderId, t, context);
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                color: AppColors.themeColer,
                child: Text(
                  'Confirm Payment',
                  style: AppFonts.fontH5semi(AppColors.themeWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String date) {
    DateTime parsedDate = DateFormat('d/M/yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

// Convert lists to the desired structure
  Map<String, dynamic> convertToJson() {
    return {
      "agent_id": agentIds
          .map((id) => id.toString())
          .toList(), // convert to strings if needed
      "date": dates.map((date) => date.toString()).toList(),
      "status": "pending",
      "service_product_ids":
          serviceProductIds.map((id) => id.toString()).toList(),
      "product_quantities": productQuantities.map((q) => q.toString()).toList(),
      "service_quantities": serviceQuantities.map((q) => q.toString()).toList(),
      "product_prices": productPrices
          .map((price) => price.toString())
          .toList(), // Ensure correct format
      "service_prices": servicePrices.map((price) => price.toString()).toList(),
      "selected_slot": selectedSlots.map((slot) => formatTime(slot)).toList(),
      "userreqtime": reqTime.map((time) => formatTime(time)).toList()
    };
  }

  // Function to format times in HH:mm format
  String formatTime(String rawTime) {
    DateTime parsedTime = DateFormat("HH:mm").parse(rawTime);
    return DateFormat("HH:mm").format(parsedTime);
  }

  submitOrder(orderid, total, context) async {
    if (orderid != null) {
       res = await MyOrder().paymentStore(orderid, total, 0, paymentMethod,
          addressController.text, notesController.text, mobile.text);

  
      if (res == true) {
        AppStyle.snackbar("OrderCompleted", "Your order is Placed,Thankyou!");

        cartitemcontoller.clearCart();
        Navigator.pop(context);
        Get.offAll(() => Layout());
      } else {
        AppStyle.snackbar("Payment Failed", "somthing worng");
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
      AppStyle.snackbar("Somting Worng", "Try few min later ,Thankyou!");
    }
  }
}
