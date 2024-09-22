import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ghore_Parlor/dashboard/Model/nearMeProductModel.dart';

import '../../main.dart';

class ServiceProductNearMeController extends GetxController {
  var nearService = <NearServiceProductModel>[].obs;
  var nearProductData = <NearProduct>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
  var selectedLocations = <int>[].obs;

  @override
  void onInit() {
    fetchServiceProductsByLocations(); // Example locations
    super.onInit();
  }

  Future<void> fetchServiceProductsByLocations() async {
    isLoading.value = true;
    error.value = '';

    final prefs = await SharedPreferences.getInstance();

    final locationsJson = prefs.getString('selectedLocations');

    if (locationsJson != null) {
      selectedLocations.value = List<int>.from(jsonDecode(locationsJson));
    }
    print(selectedLocations.value);
    var token = tdata.getuser();

    var headersList = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(
        'https://softisan.xyz/api/service-products/filter-by-locations');

    var body = {"location_ids": selectedLocations.value};

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    print(resBody);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final jsonData = jsonDecode(resBody);
      NearServiceProductModel allProductModel =
          NearServiceProductModel.fromJson(jsonData);
      nearProductData.value = allProductModel.nearProduct!;

// nearService.value=NearProduct.fromJson(d)
      print(nearProductData.value);
    } else {
      print(res.reasonPhrase);
    }
    isLoading.value = false;
  }
}
