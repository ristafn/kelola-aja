import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  const Product({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.stock,
    required this.image,
  });

  final String id;
  final String code;
  final String name;
  final int price;
  final int stock;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
