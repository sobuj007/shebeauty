import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/main.dart';
import 'dart:convert';

import 'package:Ghore_Parlor/provider/Model/allProductModel.dart';
// Adjust the import as needed

class AllProductController extends GetxController {
  var isLoading = true.obs;
  var allProducts = [].obs;
  var product = <Products>[].obs;
  var filteredList = <Products>[].obs;
  var searchQuery = ''.obs;
  var subcatid = ''.obs;
  var fil2 = <Products>[].obs;
var isAllProductsChecked = false.obs; // Checkbox state
  final TextEditingController filterController = TextEditingController();

  // RxList for selected genders and ratings
  var _selectedGender = ['All', 'Male', 'Female'].obs;
  var _selectedRating = [1.0, 2.0, 3.0, 4.0, 5.0].obs;

  // RxString for single selected value
  var selectedGender = 'All'.obs;
  var selectedRating = 1.0.obs;

  // RxString for search query

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    var token = tdata.getuser();
    var headersList = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://softisan.xyz/api/serviceproducts/getall');
    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    try {
      isLoading(true);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      // Print the raw response for debugging
      print('Response Status Code: ${res.statusCode}');
      print('Response Body: $resBody');

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(resBody);
        print('Decoded JSON: $jsonData');

        // Ensure the JSON matches the expected format
        //  var allProductModel=  AllProductModel.fromJson(jsonData);

        AllProductModel allProductModel = AllProductModel.fromJson(jsonData);

        // Update your state with the fetched data

        filteredList.value = allProductModel.products!;
        product.value=allProductModel.products!;
      } else {
        print('Failed to load products with status code: ${res.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

// Function to filter products by subcategory_id from the 'product' list
  void filterBySubcategory(String id) {
     
//    if(subcategoryId.isEmpty){
// filteredList.value = product;
//    }else{
     subcatid.value=id;
    filteredList.value = product.where((prod) {
      return prod.subcategoryId == id.toString();
    }).toList();
  //  }
  }
 

  // Function to update selected gender
  void updateSelectedGender(String gender) {
    print(gender);
     filteredList.value = product.where((prod) {
      return prod.gender == gender.toLowerCase();
    }).toList();
     // Update the filtered products list
  }

  // // Function to update selected rating
  // void updateSelectedRating(double rating) {
  //   selectedRating.value = rating;
  //   // filterProducts(); // Update the filtered products list
  // }
 // Additional filter: for gender and ratings from the 'product' list
  void applyGenderFilter() {
    filteredList.value = product.where((prod) {
      if (selectedGender.value == 'All') {
        return true; // No filtering by gender if 'All' is selected
      }
      return prod.gender?.toLowerCase() == selectedGender.value.toLowerCase();
    }).toList();
  }

  // void applyRatingFilter(double minRating) {
  //   // Assuming you have a `rating` field in the Products model
  //   filteredList.value = product.where((prod) {
  //     return prod.rating! >= minRating; // Filter products by rating
  //   }).toList();
  // }
  void filterItemsQuery(String query) {
    final lowerQuery = query.toLowerCase();
    if (lowerQuery.isEmpty) {
      fil2.value = (product);
    } else {
      fil2.value = product
          .where((prod) =>
              prod.name != null &&
              prod.name!.toLowerCase().contains(lowerQuery))
          .toList();
    }
    filteredList = fil2;
    print("object");
    print(filteredList.value);
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterItemsQuery(searchQuery.value);
  }
   // Toggle between showing all products and filtering by subcategory
   toggleAllProducts(bool isChecked) {
    isAllProductsChecked.value = isChecked;

    if (isChecked) {
     filteredList.value = product; // Show all products
     
    } else {
       
   filterBySubcategory(subcatid.value);
    
    }
    print(filteredList);
   
  }

  // Call this function when the checkbox changes
  void updateFilters(bool isChecked,) {
    if (isChecked) {
      // No subcategory filter applied, fetch all products
      filteredList.value = product;
    } else {
      // Apply combined filters when checkbox is unchecked
       filterBySubcategory(subcatid.value);
    }
  }
}
