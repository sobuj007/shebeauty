import 'dart:convert';

import 'package:get/get.dart';
import 'package:shebeauty/auth/Model/promotionsModel.dart';
import 'package:http/http.dart' as http;


  
class AdsController extends GetxController {
  // Observable list of stores
  var adslist = [].obs;

  Future<void> fetchData() async {
    var headersList = {
       'Accept': 'application/json' 
     
    };
    var url = Uri.parse('https://softisan.xyz/api/promotion-banners');

    try {
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print("Fetching data all ads 2");

        // Parse the JSON response
        var jsonResponse = jsonDecode(resBody);
        print(jsonResponse);

        var data = PromotionadsModel.fromJson(jsonResponse);

        // Update the observable list with the parsed data
        var promotionAdsModel = PromotionadsModel.fromJson(jsonResponse);

        // Update the observable list
        adslist.value = promotionAdsModel.data;
        print(adslist); // Debug print to verify
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  get getStores=> adslist;
  
}
