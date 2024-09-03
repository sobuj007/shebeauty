import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shebeauty/utils/appApis.dart';
import 'dart:convert';
import '../Model/allProductModel.dart';

class ProductController extends GetxController {
  var product = <Allproduct>[].obs;
  var fil2 = <Allproduct>[].obs;
  var isLoading = true.obs;
   final TextEditingController filterController = TextEditingController();
// The full list of products
  var filteredList = <Allproduct>[].obs;
  // RxList for selected genders and ratings
  var _selectedGender = ['All', 'Male', 'Female'].obs;
  var _selectedRating = [1.0, 2.0, 3.0, 4.0, 5.0].obs;

  // RxString for single selected value
  var selectedGender = 'All'.obs;
  var selectedRating = 1.0.obs;
    var searchQuery = ''.obs;
  // RxString for search query
 
  @override
  void onInit() {
    fetchProducts();
      searchQuery.listen((query) => filterItemsQuery(query)); 
    super.onInit();
  //  filterText.listen((text) => _filterItems(text));
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(AppAppis.getallproduct),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            json.decode(response.body) as Map<String, dynamic>;

        final List<dynamic> productList =
            data['allproduct'] as List<dynamic>? ?? [];

        if (productList != null) {
          product.value = productList
              .where((item) => item != null) // Filter out null items
              .map((json) => Allproduct.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      } else {
        // Handle error

        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      // Handle exception
      print(e);
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
  // The filtered list of products

  // Function to filter products by subcategory
  filterBySubcategory(String subcategory) {
    filteredList.value =
        product.where((product) => product.subcategory == subcategory).toList();
   // product.value = filteredList;
     filteredList;
  }

  // Function to update selected gender
  void updateSelectedGender(String gender) {
    selectedGender.value = gender;
   // filterProducts(); // Update the filtered products list
  }

  // Function to update selected rating
  void updateSelectedRating(double rating) {
    selectedRating.value = rating;
   // filterProducts(); // Update the filtered products list
  }

  

 
  void filterItemsQuery(String query) {
    final lowerQuery = query.toLowerCase();
    if (lowerQuery.isEmpty) {
      fil2.value=(product);
    } else {
      fil2.value = product.where((prod) =>
          prod.name != null &&
          prod.name!.toLowerCase().contains(lowerQuery)).toList();
    
    }
    filteredList=fil2;
    print("object");
    print(filteredList.value);
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterItemsQuery(searchQuery.value);
  } 

}
