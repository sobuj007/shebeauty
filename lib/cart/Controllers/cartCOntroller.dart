import 'dart:convert';

import 'package:get/get.dart';
import '../Model/cartModel.dart';


class CartController extends GetxController {
  var items = <CartItem>[].obs;

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
  }

  void clearCart() {
    items.clear();
  }

  // Method to convert the cart to JSON
  String toJson() {
    return jsonEncode(items.map((item) => item.toJson()).toList());
  }
}