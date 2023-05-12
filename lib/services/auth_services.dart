import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/utils.dart';

import '../constants/error_handling.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String url = "192.168.1.8";
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: "",
          // name: name,
          email: email,
          password: password,
          token: "",
          cart: []);
      http.Response res = await http.post(
        Uri.parse("http://192.168.0.100:2000/api/auth/register"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          // 'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          // 'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials!',
            );
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse("http://192.168.0.100:2000/api/auth/login"),
              body: jsonEncode({
                'email': email,
                'password': password,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // showSnackBar(
            //   context,
            //   'Account created! Login with the same credentials!',
            // );
            Navigator.pushNamed(context, "/home");
            showSnackBar(context, "Login Success");
          });
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
