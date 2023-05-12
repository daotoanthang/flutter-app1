import 'dart:convert';

class Order {
  final String id;
  List<Map<String, dynamic>> products;

  // final num subtotal; //phí ship
  // final num total;

  Order({
    required this.id,
    // required this.userId,
    required this.products,
    // required this.subtotal,
    // required this.total,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        // 'userId': userId,
        'products': products
            .map((x) => {
                  'productId': x['id'],
                  'title': x['title'] ?? "",
                  'price': x['price'] ?? 0.0,
                })
            .toList(),
        // 'subtotal': subtotal,
        // 'total': total,
      };

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? "chưa có id",
      // userId: map['userId'] ?? "",
      products: List<Map<String, dynamic>>.from(map['products']?.map((x) => {
            'productId': x['id'],
            'title': x['title'],
            'price': x['price'],
          })),
      // subtotal: map['subtotal'],
      // total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
