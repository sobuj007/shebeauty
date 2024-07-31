import 'package:get/get.dart';
import 'dart:convert';

import '../Model/cartModel.dart';
 // Import your CartItem model

class CartController extends GetxController {
  var items = <CartItem>[].obs;

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.item.id == id);
  }

  void clearCart() {
    items.clear();
  }

  // Check if item exists by name
  bool itemExists(String name) {
    return items.any((i) => i.item.name == name);
  }

  // Convert cart to JSON
  String toJson() {
    return jsonEncode(items.map((item) => item.toJson()).toList());
  }
}
