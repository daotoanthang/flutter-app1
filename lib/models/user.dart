import 'dart:convert';

class User {
  final String id;
  // final String name;
  final String token;
  final String email;
  final String password;
  final List<dynamic>? cart;

  User({
    required this.id,
    // required this.name,
    required this.email,
    required this.password,
    required this.token,
    this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      // 'name': name,
      'email': email,
      'password': password,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      // name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
