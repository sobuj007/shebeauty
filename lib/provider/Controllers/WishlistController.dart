import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../Model/allProductModel.dart';
import '../Model/allProductModel.dart';
import '../Model/wishListproductModel.dart';

class WishlistController extends GetxController {
  var wishlist = <WishlistProduct>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadWishlistFromPreferences();
  }

  clearlist() {
    wishlist.clear();
  }

  void addProductToWishlist(product) {
    final jsonMap = product.toJson();
    print("product.sprice");
    print(jsonMap['agentid']);
    WishlistProduct wishlistProduct = WishlistProduct(
      id: jsonMap['id']?.toString() ?? '',
      name: jsonMap['name'] ?? '',
      img: jsonMap['img'] ?? '',
      sprice: jsonMap['sprice']?.toString() ?? '0.00',
      pprice: jsonMap['pprice']?.toString() ?? '0.00',
      agentid: jsonMap['agentid']?.toString() ?? '',
      categoryId: jsonMap['category_id']?.toString() ?? '',
      subcategoryId: jsonMap['subcategory_id']?.toString() ?? '',
      bodypartId: jsonMap['bodypart_id']?.toString() ?? '',
      cityId: jsonMap['city_id']?.toString() ?? '',
      locationIds: jsonMap['location_ids']?.toString() ?? '',
      slotId: jsonMap['slot_id']?.toString() ?? '',
      appointmentSlotIds: jsonMap['appointment_slot_ids']?.toString() ?? '',
      description: jsonMap['description'] ?? '',
      gender: jsonMap['gender'] ?? '',
      averageRating: jsonMap['average_rating'] ?? 0,
      createdAt: jsonMap['created_at'] ?? '',
      updatedAt: jsonMap['updated_at'] ?? '',
    );

    // Check if the product is already in the wishlist
    if (!wishlist.any((item) => item.id == wishlistProduct.id)) {
      wishlist.add(wishlistProduct);
      saveWishlistToPreferences();
    }

    print(wishlist);
  }

  void removeProductFromWishlist(int id) {
    wishlist.removeWhere((item) => item.id.toString() == id.toString());
    print(wishlist);
  }

  List<WishlistProduct> getWishlist() {
    return wishlist;
  }

  // Check if a product is in the wishlist
  bool isProductInWishlist(int id) {
    return wishlist.any((item) => item.id == id);
  }

  Future<void> saveWishlistToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> wishlistJson =
        wishlist.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('wishlist', wishlistJson);
  }

  Future<void> loadWishlistFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? wishlistJson = prefs.getStringList('wishlist');

    if (wishlistJson != null) {
      wishlist.value = wishlistJson.map((jsonStr) {
        return WishlistProduct.fromJson(jsonDecode(jsonStr));
      }).toList();
    }
  }
}
