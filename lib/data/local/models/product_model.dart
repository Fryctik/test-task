import 'package:flutter/material.dart';

class Product {
  final String title;
  final String imagePath;
  final String price;
  final String? size;
  final Color? color;
  final String desc;
  final int quantity;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    this.size,
    this.color,
    required this.desc,
    this.quantity = 1,
  });

  Product copyWith({
    String? title,
    String? imagePath,
    String? price,
    String? size,
    Color? color,
    String? desc,
    int? quantity,
  }) {
    return Product(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      size: size ?? this.size,
      color: color ?? this.color,
      desc: desc ?? this.desc,
      quantity: quantity ?? this.quantity,
    );
  }
}
