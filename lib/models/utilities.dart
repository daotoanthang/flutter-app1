// import 'dart:convert';
// import 'package:flutter_app/models/products.dart';
// import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart';
// import 'package:quiver/strings.dart';

import 'package:flutter_app/models/products.dart';


class Utilities {
  // String url = 'http://192.168.0.100:3000/api/food';
  // static List<Products> data = [];
  // Future<List<Products>> getProducts() async {
  //   var res = await http.get(url);
  //   if(res.statusCode == 200) {
  //     var content = res.body;
  //     print(content.toString());
  //     var arr = json.decode(content)['food'] as List;
  //     return arr.map((e) => _fromJson(e)).toList();
  //   }
  // }
  // return List<Products>;
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your mail';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 8) {
      return "Password more than 8 characters";
    } else {
      return null;
    }
  }

  static bool equalsIgnoreCase(String? a, String? b) =>
      (a == null && b == null) ||
      (a != null && b != null && a.toLowerCase() == b.toLowerCase());

  static String? confirmPassword(String password, String confirmPassword) {
    if (!equalsIgnoreCase(password, confirmPassword)) {
      return "Confirm password invalid";
    }
    return null;
  }
}

// void Products; _fromJson(Map<String, dynamic>item) {
//   return new Products(
//     description: item['description'],
//     title: item['title'],
//     image: item['image'],
//     price: double.parse(item['price'])
//   );
// }

// class Products {
// }