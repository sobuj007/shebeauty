import 'dart:convert';

import 'package:get/get.dart';
import 'package:shebeauty/auth/Controllers/userContoller.dart';
import 'package:shebeauty/auth/Model/storeprofileModel.dart';
import 'package:http/http.dart' as http;


  
class StorProfileController extends GetxController {
  // Observable list of stores
  var stores = [].obs;
//  @override
//   void onInit() {
//     super.onInit();
//     fetchData(); // Fetch data when the controller is initialized
//   }
  Future<void> fetchData() async {
    var user= Get.find<Usercontoller>();
    var token= user.token.value;
    print(token);
    // var headersList = {
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };
    // var url = Uri.parse('https://softisan.xyz/api/storeprofiles/get');

    // try {
    //   var req = http.Request('GET', url);
    //   req.headers.addAll(headersList);

    //   var res = await req.send();
    //   final resBody = await res.stream.bytesToString();

    //   if (res.statusCode >= 200 && res.statusCode < 300) {
    //     print("Fetching data all store");

    //     // Parse the JSON response
    //     var jsonResponse = jsonDecode(resBody);
    //     // print(jsonResponse);

    //     var data = StoreprofileModel.fromJson(jsonResponse);

    //     // Update the observable list with the parsed data
    //     stores.value = data.data; // Updating the list of stores

    //     // print(stores); // Debug print to verify
    //   } else {
    //     print(res.reasonPhrase);
    //   }
    // } catch (e) {
    //   print('Error: $e');
    // }
  }

   getStores() {
    return stores;
  }
}
