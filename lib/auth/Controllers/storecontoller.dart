import 'dart:convert';

import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/auth/Model/storeprofileModel.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/main.dart';

import '../../utils/appApis.dart';

class StorProfileController extends GetxController {
  // Observable list of stores
  var stores = [].obs;
//  @override
//   void onInit() {
//     super.onInit();
//     fetchData(); // Fetch data when the controller is initialized
//   }
  Future<void> fetchData() async {
    var token = tdata.getuser();

    var headersList = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(AppAppis.endpoint + 'storeprofiles/get');

    try {
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print("Fetching data all store");

        // Parse the JSON response
        var jsonResponse = jsonDecode(resBody);
        // print(jsonResponse);

        var data = StoreprofileModel.fromJson(jsonResponse);

        // Update the observable list with the parsed data
        stores.value = data.data!; // Updating the list of stores

        // print(stores); // Debug print to verify
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  getStores() {
    return stores;
  }

  String? getStoreNameByAgentId(int agentId) {
    // Find the store with the matching agentId
    final store = stores.firstWhere(
      (store) => store.agentId == agentId,
      orElse: () => null, // Returns null if no match is found
    );

    // Return the store name if the store is found, otherwise return null
    return store?.storename;
  }

  String? getStoreAddressByAgentId(int agentId) {
    // Find the store with the matching agentId
    final store = stores.firstWhere(
      (store) => store.agentId == agentId,
      orElse: () => null, // Returns null if no match is found
    );

    // Return the store name if the store is found, otherwise return null
    return store?.address;
  }

  String? getStorePhonByAgentId(int agentId) {
    // Find the store with the matching agentId
    final store = stores.firstWhere(
      (store) => store.agentId == agentId,
      orElse: () => null, // Returns null if no match is found
    );

    // Return the store name if the store is found, otherwise return null
    return store?.mobile;
  }
}
