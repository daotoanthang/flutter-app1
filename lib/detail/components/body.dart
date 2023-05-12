import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/detail/components/addtocart.dart';
import 'package:flutter_app/models/products.dart';

class Body extends StatelessWidget {
  late Products product;
  Body({required this.product});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.asset(product.image),

          ),
          SizedBox(height: 20),
          Expanded(child: Text("Description: ${product.description}"),flex: 1,),
          AddProductToCart(product: product),
        ],
      )
    );
  }
}
