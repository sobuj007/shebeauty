import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ghore_Parlor/category/Model/getAllinfoData.dart';
import 'package:Ghore_Parlor/provider/Model/allProductModel.dart';

import '../../utils/appApis.dart';

// GetX Controller
class AllinfoController extends GetxController {
  var allinfoModel = Rx<AllinfoModel?>(null);

  var filteredLocations = <Location>[].obs;
  var selectedCityId = Rx<int?>(null);
  var selectedLocations = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    loadStoredData();
  }

  Future<void> fetchData() async {
    var headersList = {
      'Accept': 'application/json',
    };
    var url = Uri.parse(AppAppis.endpoint + 'getall');

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
        allinfoModel.value = AllinfoModel.fromJson(jsonResponse);

        // Update the observable with the parsed data
        allinfoModel.value = allInfo;
      } else {
        // print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<Category>? get categories => allinfoModel.value?.category;
  List<Subcategory>? get subcategories => allinfoModel.value?.subcategory;
  List<Bodypart>? get bodyParts => allinfoModel.value?.bodypart;
  List<Cities>? get cities => allinfoModel.value?.cities;
  List<Location>? get locations => allinfoModel.value?.location;
  // Method to filter categories by gender
  getCategoriesByGender(String gender) {
    // print(gender);
    //return
    return allinfoModel.value?.category
        ?.where((category) =>
            category.gender == gender || category.gender == 'both')
        .toList();
  }

  // Method to filter subcategories by name
  filterSubcategoriesByName(int id) {
    return subcategories
        ?.where((subcategory) => subcategory.categoryId == id)
        .toList();
  }

  // filterBodypartsByName(String id) {
  //   return bodyParts?.where((bodypart) => bodypart.subcategoryId == id).toList();
  // }
  List<String?> filterBodypartsByName(int id) {
    return bodyParts!
        .where((bodypart) => bodypart.subcategoryId == id)
        .map((bodypart) => bodypart.name)
        .toList();
  }

  //  getlocationBycityid(String id) {
  //   // print(gender);
  //   //return
  // return allinfoModel.value?.location?.where((category) =>
  //       locations?.citiesId == id ).toList();

  // }

// name category...............
  String? getSubcategoryNameById(int id) {
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

  getCategoryDescriptionById(int id) {
    if (categories == null) return null;

    // Search for the category with the matching ID
    for (var category in categories!) {
      if (category.id == id) {
        return category.catDescription; // Return the name if found
      }
    }
    return null; // Return null if no match is found
  }

  void selectCity(int? cityId) {
    selectedCityId.value = cityId;
    filterLocations(cityId);
  }

  void filterLocations(cityId) {
    if (selectedCityId.value == null) {
      filteredLocations.clear();
    } else {
      if (locations != null) {
        filteredLocations.value = locations!
            .where((location) => location.citiesId == cityId)
            .toList();
      } else {
        // Handle the case when locations is null, e.g., set filteredLocations to an empty list
        filteredLocations.value = [];
      }
      // filteredLocations.value = locations!.where((location) => location.citiesId == cityId.toString()).toList();
    }
    print(filteredLocations);
  }

  void toggleLocation(int locationId) {
    if (selectedLocations.contains(locationId)) {
      selectedLocations.remove(locationId);
    } else {
      selectedLocations.add(locationId);
    }
    saveSelectedLocations();
  }

  Future<void> saveSelectedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLocations', jsonEncode(selectedLocations));
    print("saved");
  }

  Future<void> saveSelectedCity(int? cityId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedCity', cityId ?? -1);
  }

  Future<void> loadStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    final cityId = prefs.getInt('selectedCity');
    final locationsJson = prefs.getString('selectedLocations');

    if (cityId != null && cityId != -1) {
      selectedCityId.value = cityId;
      filterLocations(cityId);
    }

    if (locationsJson != null) {
      selectedLocations.value = List<int>.from(jsonDecode(locationsJson));
    }
  }

  // Future<void> saveSelectedLocationsToServer() async {
  //   if (selectedCityId.value == null || selectedLocations.isEmpty) {
  //     print('No city or locations selected');
  //     return;
  //   }

  //   var url = Uri.parse('http://softisan.xyz/api/saveLocations');
  //   var headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer YOUR_TOKEN' // Replace with your actual token
  //   };

  //   var body = jsonEncode({
  //     'city_id': selectedCityId.value,
  //     'locations': selectedLocations,
  //   });

  //   try {
  //     var response = await http.post(url, headers: headers, body: body);
  //     if (response.statusCode == 200) {
  //       print('Locations saved successfully');
  //     } else {
  //       print('Failed to save locations: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error saving locations: $e');
  //   }
  // }
}
