import 'package:flutter/material.dart';

class Categories {
  late int id;
  late String title;
  late String image;

  Categories({required this.id,required this.title,required this.image});

  static List<Categories> init() {
    List<Categories> data = [
      Categories(id: 1, title: "Highland", image: "assets/images/ic_highland.png"),
      Categories(id: 2, title: "Highland", image: "assets/images/ic_circlek.png"),
      Categories(id: 3, title: "Highland", image: "assets/images/ic_ministop.png"),
      Categories(id: 4, title: "Highland", image: "assets/images/ic_seveneleven.png"),
      Categories(id: 5, title: "Highland", image: "assets/images/ic_vinmart.png"),

    ];
    return data;
  }
}