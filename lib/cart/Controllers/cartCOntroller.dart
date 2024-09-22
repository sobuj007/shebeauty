import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'dart:convert';

import '../Model/cartModel.dart';
 // Import your CartItem model

class CartController extends GetxController {
  var items = <CartItem>[].obs;

    @override
  void onInit() {
    super.onInit();
    // Load cart items from SharedPreferences when the controller is initialized
    loadCartItems();
  }

  void addItem(CartItem item) {
    items.add(item);
    saveCartItems();
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.item.id == id);
    if(items.isEmpty){
      items.clear();
    }
  }

  Future<void> clearCart() async {
    items.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
  

  }
  getitems()=>items;

  // Check if item exists by name
   itemExists(String id) {
    return items.any((i) => i.item.id == id);
  }
 // Check if item exists by name

   

  // Convert cart to JSON
  String toJson() {
    return jsonEncode(items.map((item) => item.toJson()).toList());
  }

  // Method to save cart items to SharedPreferences
  Future<void> saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItemsJson = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', cartItemsJson);
  }

  // Method to load cart items from SharedPreferences
  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsJson = prefs.getStringList('cartItems');
    if (cartItemsJson != null) {
      items.value = cartItemsJson.map((jsonString) {
        Map<String, dynamic> json = jsonDecode(jsonString);
        return CartItem.fromJson(json);
      }).toList();
    }
    print(cartItemsJson);
  }
   // Method to calculate the total price of all cart items
  // Method to calculate the total price of all cart items
  double calculateTotalPrice() {
    return items.fold(0.0, (total, item1) {
      double productTotal = double.parse(item1.pprice) * double.parse(item1.selectedProductQun);
      double serviceTotal =double.parse( item1.sprice )* double.parse(item1.selectedServicsQun);
      return total + productTotal + serviceTotal;
    });
  }

   // Function that returns a list of item ids
   getItemIds() {
    return items.map((item) => item.item.id.toString()).toList();
  }
 getItemsquan() {
    return items.map((item) => item.selectedServicsQun.toString()).toList();
  }
 getItempquan() {
    return items.map((item) => item.selectedProductQun.toString()).toList();
  }
 getItempprice() {
    return items.map((item) => item.pprice).toList();
  }
   getItemsprice() {
    return items.map((item) => item.sprice).toList();
  }

 getItemsreqtime() {
    return items.map((item) => item.selectedTime.toString()).toList();
  }
 getItemsagents() {
    return items.map((item) => item.agentid.toString()).toList();
  }
  
 getOrderDate() {
    return items.map((item) => item.selectedDate.toString()).toList();
  }
 getOrderReqTime() {
    return items.map((item) => item.selectedTime.toString()).toList();
  }
  

}
