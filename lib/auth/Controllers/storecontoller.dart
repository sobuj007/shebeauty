import 'dart:convert';

import 'package:get/get.dart';
import 'package:shebeauty/auth/Model/storeprofileModel.dart';
import 'package:http/http.dart' as http;


  
class StorProfileController extends GetxController {
  // Observable list of stores
  var stores = <Store>[].obs;

  Future<void> fetchData(String token) async {
    var headersList = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse('https://softisan.xyz/api/storeprofiles/get');

    try {
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print("Fetching data all");

        // Parse the JSON response
        var jsonResponse = jsonDecode(resBody);
        // print(jsonResponse);

        var data = StoreprofileModel.fromJson(jsonResponse);

        // Update the observable list with the parsed data
        stores.value = data.data; // Updating the list of stores

        // print(stores); // Debug print to verify
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<Store> getStores() {
    return stores;
  }
}
