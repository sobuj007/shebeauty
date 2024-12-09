import 'dart:convert';

import 'package:Ghore_Parlor/provider/Controllers/ProductContorller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:intl/intl.dart';

import '../utils/appApis.dart';
import 'model/HistoryModel.dart';

class HistoryController extends GetxController {
  var historyModel = HistoryModel().obs; // Observable history model
  var isLoading = true.obs; // Observable to show loading state
  var hasError = false.obs; // Observable to show error state
  var procon = Get.put(AllProductController());
  @override
  void onInit() {
    super.onInit();
    procon.fetchProducts();
  }

  // Fetch history data from the API
  fetchHistory(id) async {
    var token = tdata.getuser();

    print("id");
    print(id);
    try {
      isLoading(true);
      var headersList = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(AppAppis.endpoint + 'orders/history');

      var body = {"user_id": id};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        var jsonResponse = json.decode(resBody);
        print(jsonResponse);
        historyModel(HistoryModel.fromJson(
            jsonResponse)); // Set the model with response data
        historyModel.value = HistoryModel.fromJson(jsonResponse);
      } else {
        hasError(true);
        print('Error: ${res.reasonPhrase}');
      }
    } catch (e) {
      hasError(true);
      print("Error: $e");
    } finally {
      isLoading(false); // Turn off loading indicator
    }
  }

  // filterPendingOrders(orders) {
  //   return orders.where((order) => order.status == "pending").toList();
  // }

  // filterCompletedOrders(orders) {
  //   return orders.where((order) => order.status == "complete").toList();
  // }

  // filterOrdersToday(orders) {
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('dd/MM/yyyy').format(now);

  //   List ordersToday = orders.where((order) {
  //     // DateTime orderDate =
  //     //     DateTime.parse(order['date']); // Assuming orders have a 'date' field
  //     // String orderFormattedDate = DateFormat('dd/MM/yyyy').format(orderDate);

  //     return order.items2.reqOrderDate == formattedDate;
  //   }).toList();

  //   print("Today's Date: $formattedDate");
  //   print("Orders Today:");
  //   print(ordersToday);

  //   return ordersToday;
  // }
}
