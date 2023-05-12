import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/checkout_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/carts.dart';
import '../../models/products.dart';

class CheckOutCart extends StatefulWidget {
  // final double sum;

  const CheckOutCart({Key? key}) : super(key: key);

  @override
  State<CheckOutCart> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _addressController = TextEditingController();
  final _checkOutFormKey = GlobalKey<FormState>();
  final FillFormService fillFormService = FillFormService();

  // @override
  // void dispose() {
  //   super.dispose();
  //   _usernameController.dispose();
  //   _phoneController.dispose();
  //   _addressController.dispose();
  // }

  void deleteCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }

  void fillFormUser() async {
    List<Map<String, dynamic>> cart = await Cart.loadCart();
    // List<Map<String, dynamic>> updatedCart = cart.map((product) {
    //   return {
    //     'productId': product["_id"],
    //     'title': product['title'],
    //     'price': product['price'],
    //   };
    // }).toList();
    fillFormService.fillForm(
      context: context,
      products: cart,
      // total: widget.sum,
    );
    deleteCart();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(0, 50),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.green)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {},
          child: Text(
            "Sum: ",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        )),
        Expanded(
            child: TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(0, 50),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.green)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () async {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // prefs.setString("TestString_key", "my value");
            if (_checkOutFormKey.currentState!.validate()) {
              fillFormUser();
            }
            Navigator.pushNamed(context, "/home");
          },
          child: Text(
            "Check out".toUpperCase(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        )),
      ],
    );
  }
}
