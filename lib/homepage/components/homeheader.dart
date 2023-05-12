import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cart/cartpage.dart';

class HomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search Product",
              prefix: Icon(Icons.search)
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, "/carts");
          },
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(10),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        )
      ],
    );
  }
}