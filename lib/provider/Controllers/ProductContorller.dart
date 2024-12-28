import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Ghore_Parlor/main.dart';
import 'dart:convert';

import 'package:Ghore_Parlor/provider/Model/allProductModel.dart';

import '../../utils/appApis.dart';
// Adjust the import as needed

class AllProductController extends GetxController {
  var isLoading = true.obs;
  var allProducts = [].obs;
  var product = <Product>[].obs;
  var filteredList = <Product>[].obs;
  var searchQuery = ''.obs;
  var subcatid = 0.obs;
  var fil2 = <Product>[].obs;
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
    var url = Uri.parse(AppAppis.endpoint + 'serviceproducts/getall');
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
        product.value = allProductModel.products!;
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
  void filterBySubcategory(int id) {
//    if(subcategoryId.isEmpty){
// filteredList.value = product;
//    }else{
// লাইল্লাহা ইল্লাহ আল আজিম ,আল হালীম , লাইল্লাহা ইল্লাহ রাবুল-আরশিল আজীম,  লাইল্লাহা ইল্লাহ রাবুশসামাওয়াত,ওয়া রাব্বুল ওয়াদ,রাব্বুল আরশিল-কারীম
    subcatid.value = id;
    filteredList.value = product.where((prod) {
      return prod.subcategoryId == id;
    }).toList();
    print("filter");
    print(filteredList);
    //  }
  }

  // Function to update selected gender
  void updateSelectedGender(String gender) {
    print(gender);
    filteredList.value = product.where((prod) {
      return prod!.gender == gender.toLowerCase();
    }).toList();
    // Update the filtered products list
  }

  String? getProductNameById(id) {
    // Check if the product list is populated
    if (product.isEmpty) return null;

    // Search for the product with the matching ID
    for (var prod in product) {
      if (prod.id == id) {
        print("prod.name"); // Print the product name for debugging
        print(prod.name); // Print the product name for debugging
        return prod.name; // Return the name if found
      }
    }
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
      return prod!.gender?.toLowerCase() == selectedGender.value.toLowerCase();
    }).toList();
  }

  // void filterproductbyBodypart(id) {
  //   filteredList.value = product.where((prod) {
  //     if (id.contain(prod.bodypartId)) {
  //       return prod.bodypartId;
  //     } else {
  //       return prod;
  //     }
  //     //return prod.bodypartId == id;
  //     // return prod.bodypartId == id;
  //   }).toList();
  // }
  void filterproductbyBodypart(selectedBodyParts) {
    filteredList.value = product.where((prod) {
      // Check if the product's bodypart exists in the selectedBodyParts list
      if (prod.bodypartId == null)
        return false; // Exclude products without a bodypart
      return selectedBodyParts.contains(prod.bodypartId);
    }).toList();
  }

  void applyRatingFilter(double minRating) {
    filteredList.value = product.where((product) {
      if (product.reviewRatings == null || product.reviewRatings!.isEmpty) {
        return false; // If no reviews, exclude this product
      }

      // Check if any of the product's reviews meet or exceed the minRating
      return product.reviewRatings!.any((review) {
        double rating = double.tryParse(review.rating.toString() ?? "0") ?? 0;
        return rating >= minRating;
      });
    }).toList();
  }

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
  void updateFilters(
    bool isChecked,
  ) {
    if (isChecked) {
      // No subcategory filter applied, fetch all products
      filteredList.value = product;
    } else {
      // Apply combined filters when checkbox is unchecked
      filterBySubcategory(subcatid.value);
    }
  }

  // Sorting function by price (High to Low)
  void sortByservicePrice({required bool isHighToLow}) {
    if (isHighToLow) {
      // Sort by price from high to low
      filteredList.value = product
          .where((prod) => prod?.sprice != null)
          .toList()
        ..sort((a, b) => b!.sprice.compareTo(a.sprice));
    } else {
      // Sort by price from low to high
      filteredList.value = product.where((prod) => prod.sprice != null).toList()
        ..sort((a, b) => a.sprice.compareTo(b.sprice));
    }
  }
}
