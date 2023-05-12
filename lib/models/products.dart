import 'dart:convert';

class Products {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price});

  static List<Products> init() {
    List<Products> data = [
      Products(
          id: 1,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
      Products(
          id: 2,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
      Products(
          id: 3,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
      Products(
          id: 4,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
      Products(
          id: 5,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
      Products(
          id: 6,
          title: "Black Coffee",
          description:
              " Black coffee is simply coffee with nothing added – no cream, no milk, no sweetener. When you leave out those extra ingredients, you leave out the calories, fat, and sugar that come with them. That allows you to enjoy the health benefits of coffee without additives that aren't as good for you.",
          image: "assets/images/ic_black_coffee.png",
          price: 5.0),
    ];
    return data;
  }

  // static fromMap(jsonDecode) {}

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'id': id,

    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? 0.0,
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));
}
