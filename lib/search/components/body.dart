import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/homepage/components/fragment/favorite_fragment.dart';
import 'package:flutter_app/models/products.dart';
import 'package:flutter_app/models/utilities.dart';
import 'package:flutter_tags/flutter_tags.dart';

class Body extends StatefulWidget {
  // List<Products> dataProduct = new List<Products>();

  List<Products> dataProduct = [];
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _tags = [];
  List<Products> products = Products.init();
  List<Products> productsResult = <Products>[];
  // List<Products> productsResult = [];
  late TextEditingController textEditingController;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    // _tags.addAll(['food', 'categories', 'bread']);
    // textEditingController = new TextEditingController();
     super.initState();
    products = Products.init();
  }

  Widget buildTag(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommend'),
          SizedBox(
            height: 10,
          ),
          Tags(
            itemCount: _tags.length,
            itemBuilder: (index) {
              // print(index.toString());
              return ItemTags(
                index: index,
                title: _tags[index],
                onPressed: (item) {
                  setState(() {
                    // widget.dataProduct.clear();
                    // widget.dataProduct.addAll(Utilities().find(item.title));
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: buildRow(),
        ),
        body: buildContainer(context));
  }

  Widget buildRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  widget.dataProduct = <Products>[];
                  return;
                }
                widget.dataProduct.clear();
                // widget.dataProduct.addAll(Utilities().find(value));
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildTag(context),
          if (widget.dataProduct.length == 0)
            Expanded(child: Center(child: Text('No item')))
          else
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: widget.dataProduct.length,
            //         itemBuilder: (context, index) {
            //           // return ProductItemList(
            //           //   product: widget.dataProduct[index],
            //           // );

            //         }))
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  if (searchController.text.isNotEmpty &&
                      !product.title
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                    return SizedBox();
                  }
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        product.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: Text("\$${product.price.toString()}"),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
