import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'products.dart';

class Cart {
  static List<Products> cart = [];

  static void addProductToCart(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cart.add(product);

    List<String> cartJsonList =
        cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);

    print(cartJsonList);
  }

  List<Products> getCart() {
    print(cart);
    return cart;
  }

  static Future<void> updateCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJsonList =
        cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);
  }

  static Future<List<Map<String, dynamic>>> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    print(cartJson);
    if (cartJson != null) {
      cart =
          cartJson.map((json) => Products.fromMap(jsonDecode(json))).toList();
      return cartJson
          .map((json) => jsonDecode(json) as Map<String, dynamic>)
          .toList();
    } else {
      return []; // Return a default value for cart
    }
  }
}
