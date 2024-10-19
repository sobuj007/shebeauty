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

  void addProductToWishlist(Products product) {
    WishlistProduct wishlistProduct = WishlistProduct(
      id: product.id.toString(),
      agentid: product.agentId,
      categoryId: product.categoryId,
      subcategoryId: product.subcategoryId,
      bodypartId: product.bodypartId,
      cityId: product.cityId,
      locationIds: product.locationIds,
      appointmentSlotIds: product.appointmentSlotIds,
      slotId: product.slotId,
      name: product.name,
      description: product.description,
      img: product.image,
      pprice: product.productPrice,
      sprice: product.servicePrice,
      gender: product.gender,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
      // Convert reviewRatings from ReviewRatings to WishlistReviewRatings
      reviewRatings: product.reviewRatings != null
          ? product.reviewRatings!
              .map((review) => WishlistReviewRatings(
                    id: review.id.toString(),
                    serviceproductId: review.serviceproductId.toString(),
                    agentId: review.agentId.toString(),
                    userId: review.userId.toString(),
                    reviewername: review.reviewername.toString(),
                    image: review.image.toString(),
                    rating: review.rating.toString(),
                    comment: review.comment.toString(),
                    createdAt: review.createdAt.toString(),
                    updatedAt: review.updatedAt.toString(),
                  ))
              .toList()
          : [], // Handle null case with an empty list
    );

    // Check if the product is already in the wishlist
    if (!wishlist.any((item) => item.id == wishlistProduct.id)) {
      wishlist.add(wishlistProduct);
      saveWishlistToPreferences();
    }

    print(wishlist);
  }

  void removeProductFromWishlist(int id) {
    wishlist.removeWhere((item) => item.id == id);
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
