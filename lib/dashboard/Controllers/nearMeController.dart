import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ghore_Parlor/dashboard/Model/nearMeProductModel.dart';

import '../../main.dart';
import '../../utils/appApis.dart';

class ServiceProductNearMeController extends GetxController {
  var nearService = <NearServiceProductModel>[].obs;
  var nearProductData = <NearProduct>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
  // var selectedLocations = <int>[].obs;
  var selectedLocations = <int>[].obs;

  @override
  void onInit() {
    fetchServiceProductsByLocations(); // Example locations
    super.onInit();
  }

  fetchServiceProductsByLocations() async {
    isLoading.value = true;
    error.value = '';

    final prefs = await SharedPreferences.getInstance();

    final locationsJson = prefs.getString('selectedLocations');
    print(locationsJson);
    if (locationsJson != null) {
      selectedLocations.value = List<int>.from(jsonDecode(locationsJson));
    }
    print("selectedLocations.value");
    print(selectedLocations.value);
    var token = tdata.getuser();

    var headersList = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var url =
        Uri.parse(AppAppis.endpoint + 'service-products/filter-by-locations');

    var body = {"location_ids": selectedLocations.value};

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);
    print(req.body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    print("resBody for near me?");
    print(resBody);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final jsonData = jsonDecode(resBody);
      NearServiceProductModel allProductModel =
          NearServiceProductModel.fromJson(jsonData);
      nearProductData.value = allProductModel.nearProduct as List<NearProduct>;

      print("nearProductData.value");
      print(nearProductData.value);

// nearService.value=NearProduct.fromJson(d)
      //  print(nearProductData.value.locationIds);
    } else {
      error.value = "Pleases Select your location from Profile";
      print(res.reasonPhrase);
    }
    isLoading.value = false;
  }
}
