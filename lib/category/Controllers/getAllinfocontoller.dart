import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shebeauty/category/Model/getAllinfoData.dart';
// GetX Controller
class AllinfoController extends GetxController {
  // Observable instance of AllinfoModel
  var allinfoModel = AllinfoModel().obs;

  Future<bool> addItem() async {
    var headersList = {'Content-Type': 'application/json'};
    var url = Uri.parse('http://softisan.xyz/api/all-info');

    try {
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        // Successfully received data
        print("Fetching data all");

        // Parse the JSON response
        Map<String, dynamic> jsonResponse = jsonDecode(resBody);

        // Update the observable with the parsed data
        allinfoModel.value = AllinfoModel.fromJson(jsonResponse);
   print(allinfoModel);
        return true;
      } else {
        print(res.reasonPhrase);
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
  List<Categories>? get categories => allinfoModel.value.categories;
  List<Subcategories>? get subcategories => allinfoModel.value.subcategories;
  List<Cities>? get cities => allinfoModel.value.cities;
  List<Locations>? get locations => allinfoModel.value.locations;
  List<BodyParts>? get bodypart => allinfoModel.value.bodyParts;


    // Method to filter subcategories by name
  filterSubcategoriesByName(String id) {
    return subcategories?.where((subcategory) => subcategory.categoryId == id).toList();
  }
  filterBodypartsByName(String id) {
    return bodypart?.where((bodypart) => bodypart.subcategoryId == id).toList();
  }

  // // Method to filter subcategories by multiple names
  // void filterSubcategoriesByNames(List<String> names) {
  //   filteredSubcategories.value = subcategories.where((subcategory) => names.contains(subcategory.name)).toList();
  // }
}