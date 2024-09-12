import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/cart/Controllers/cartCOntroller.dart';
import 'package:shebeauty/dashboard/Screens/layout.dart';
import 'package:shebeauty/order/OrderContoller.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:shebeauty/utils/custom%20widget/CustomAppbar.dart';
import 'package:sizer/sizer.dart';

import '../utils/appStyle.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var cartItems=Get.put(CartController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Invoice'),
      // ),
      body: Column(
        children: [
          CustomAppbar(title: "Invoice",),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.h,vertical: 1.w),
              child: ListView.builder(
                padding: EdgeInsets.zero, 
                itemCount: cartItems.items.length,
                itemBuilder: (context, index) {
                  var data=cartItems.items[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(data.img),
                      title: Text(data.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('S.Quantity: ${data.selectedServicsQun}',style: AppFonts.fontH7semi(AppColors.themeBlack),),
                              Text('Price: ${data.sprice}',style: AppFonts.fontH7semi(AppColors.themeBlack),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('P.Quantity: ${data.selectedProductQun}',style: AppFonts.fontH7semi(AppColors.themeBlack),),
                              Text('Price: ${data.pprice}',style: AppFonts.fontH7semi(AppColors.themeBlack),),
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
                Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(cartItems.calculateTotalPrice().toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showPaymentModal(context);
            },
            child: Container(alignment: Alignment.center,width: 100.w,height:5.8.h,color: AppColors.themeColer,child: Text('Proceed to Payment',style: AppFonts.fontH5semi(AppColors.themeWhite),)),
          ),
        ],
      ),
    );
  }

 void _showPaymentModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the modal to resize when the keyboard appears
    builder: (context) {
      return PaymentModal();
    },
  );
}}

class PaymentModal extends StatefulWidget {
  @override
  _PaymentModalState createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  var cartitemcontoller= Get.put(CartController());
  String paymentMethod = 'Cash on Delivery';
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts padding for keyboard
      ),
      child: SingleChildScrollView( // Wrap content with scroll view
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
              decoration: InputDecoration(
                labelText: 'Mobile',
                 labelStyle: AppFonts.fontH6semi(AppColors.themeBlack),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle the payment and order confirmation logic here
                if (addressController.text.isNotEmpty&& mobile.text.isNotEmpty) {
                  // Process order/payment
                var data=cartitemcontoller.getitems();
                  // var agent=cartitemcontoller.items.agentId;
                 var orderids= MyOrder().storeOrder(1, cartitemcontoller.getItemsreqtime(), cartitemcontoller.getItemIds(), cartitemcontoller.getItempquan(), cartitemcontoller.getItemsquan(), cartitemcontoller.getItempprice(), cartitemcontoller, cartitemcontoller.getItemsreqtime());
                 submitOrder(orderids);
                }
                Navigator.pop(context);
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


   submitOrder(orderid){
    if(orderid!=null){
      AppStyle.snackbar("OrderCompleted", "Your order is Placed,Thankyou!");
      cartitemcontoller.clearCart();
     
Get.offAll(() => Layout());
    }else{
      AppStyle.snackbar("Somting Worg", "Try few min later ,Thankyou!");
    }


   }
}