import 'dart:convert';
import 'package:flutter_app/constants/error_handling.dart';
// import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:flutter_app/constants/utils.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FillFormService {
  void fillForm({
    required BuildContext context,
    required List<Map<String, dynamic>> products,
    // required num total,
  }) async {
    final userId = Provider.of<UserProvider>(context, listen: false).user.id;
    try {
      Order order = Order(
        id: "",
        userId: userId,
        products: products,
        // total: total,
      );
      http.Response res = await http.post(
        Uri.parse('http://192.168.0.100:2000/api/order'),
        body: order.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Navigator.pushNamed(context, "/home");
          String orderId = json.decode(res.body)['_id'];
          print(res.body);
        },
      );
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
