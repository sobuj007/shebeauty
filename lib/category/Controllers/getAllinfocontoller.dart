import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shebeauty/category/Model/getAllinfoData.dart';
// GetX Controller
class AllinfoController extends GetxController {
    var allinfoModel = Rx<AllinfoModel?>(null);

  Future<void> fetchData() async {
    var headersList = {'Accept': 'application/json',};
    var url = Uri.parse('http://softisan.xyz/api/getall');

    try {
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        // print("Fetching data all");

        // Parse the JSON response
        var jsonResponse = jsonDecode(resBody);
        var allInfo = AllinfoModel.fromJson(jsonResponse);

        // Update the observable with the parsed data
        allinfoModel.value = allInfo;
         print(allinfoModel.value);  // Debug print
      } else {
        // print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
    List<Categories>? get categories => allinfoModel.value?.categories;
  List<Subcategories>? get subcategories => allinfoModel.value?.subcategories;
  List<BodyParts>? get bodyParts => allinfoModel.value?.bodyParts;
  List<Cities>? get cities => allinfoModel.value?.cities;
  List<Locations>? get locations => allinfoModel.value?.locations;
  // Method to filter categories by gender
   getCategoriesByGender(String gender) {
    // print(gender);
    //return
  return allinfoModel.value?.categories?.where((category) =>
        category.gender == gender || category.gender == 'both').toList();
        
  }
    // Method to filter subcategories by name
  filterSubcategoriesByName(String id) {
    return subcategories?.where((subcategory) => subcategory.categoryId == id).toList();
  }
  filterBodypartsByName(String id) {
    return bodyParts?.where((bodypart) => bodypart.subcategoryId == id).toList();
  }
// name category...............
    String? getSubcategoryNameById (int id) {
    if (subcategories == null) return null;

    // Search for the category with the matching ID
    for (var subcategory in subcategories!) {
      if (subcategory.id == id) {
        return subcategory.name; // Return the name if found
      }
    }
    return null; // Return null if no match is found
  }
// name category...............
    String? getCategoryNameById(int id) {
    if (categories == null) return null;

    // Search for the category with the matching ID
    for (var category in categories!) {
      if (category.id == id) {
        return category.name; // Return the name if found
      }
    }
    return null; // Return null if no match is found
  }

}

//   List<Categories>? get categories => allinfoModel.value?.categories;
//   List<Subcategories>? get subcategories => allinfoModel.value?.subcategories;
//   List<BodyParts>? get bodyParts => allinfoModel.value?.bodyParts;
//   List<Cities>? get cities => allinfoModel.value?.cities;
//   List<Locations>? get locations => allinfoModel.value?.locations;
// // Method to filter categories by gender
//    getCategoriesByGender(String gender) {
//     print(gender);
//     //return
//    var p=  allinfoModel.value?.categories?.where((category) =>
//         category.gender == gender || category.gender == 'both').toList();
//         print(categories);
//   }
//     // Method to filter subcategories by name
//   filterSubcategoriesByName(String id) {
//     return subcategories?.where((subcategory) => subcategory.categoryId == id).toList();
//   }
//   filterBodypartsByName(String id) {
//     return bodyParts?.where((bodypart) => bodypart.subcategoryId == id).toList();
//   }
// // name category...............
//     String? getSubcategoryNameById (int id) {
//     if (subcategories == null) return null;

//     // Search for the category with the matching ID
//     for (var subcategory in subcategories!) {
//       if (subcategory.id == id) {
//         return subcategory.subcategoryName; // Return the name if found
//       }
//     }
//     return null; // Return null if no match is found
//   }
// // name category...............
//     String? getCategoryNameById(int id) {
//     if (categories == null) return null;

//     // Search for the category with the matching ID
//     for (var category in categories!) {
//       if (category.id == id) {
//         return category.name; // Return the name if found
//       }
//     }
//     return null; // Return null if no match is found
//   }

  // // Method to filter subcategories by multiple names
  // void filterSubcategoriesByNames(List<String> names) {
  //   filteredSubcategories.value = subcategories.where((subcategory) => names.contains(subcategory.name)).toList();
  // }
