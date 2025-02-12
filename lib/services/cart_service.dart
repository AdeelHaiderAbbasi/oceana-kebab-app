import 'dart:convert';  // For JSON encoding and decoding
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartService {
  static const String cartKey = 'cart_items'; // The key for storing the cart

  // Save cart items to SharedPreferences
  static Future<void> saveCartItems(List<CartModel> cartItems) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the list of CartModel objects to a list of JSON strings
    List<String> cartItemsJson = cartItems.map((item) => json.encode(item.toJson())).toList();

    // Save the list to SharedPreferences
    await prefs.setStringList(cartKey, cartItemsJson);
  }

  // Get cart items from SharedPreferences
  static Future<List<CartModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();

    // Get the list of JSON strings from SharedPreferences
    List<String>? cartItemsJson = prefs.getStringList(cartKey);

    if (cartItemsJson == null) {
      return [];  // Return an empty list if no items are found
    }

    // Convert each JSON string back to a CartModel object
    return cartItemsJson.map((itemJson) {
      Map<String, dynamic> itemMap = json.decode(itemJson);
      return CartModel.fromJson(itemMap);
    }).toList();
  }

  // Clear the saved cart
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey); // Remove the cart from SharedPreferences
  }
}
