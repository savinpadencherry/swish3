import 'dart:core';

import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;

  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      color: json["color"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "price": price,
      "description": description,
      "color": color,
    };
  }
}

List<Product> products = [
  Product(
      id: 1,
      title: "Coke",
      price: 234,
      description: dummyText,
      image: 'assets/Coke.png',
      color: Colors.red),
  Product(
      id: 2,
      title: "Fanta",
      price: 234,
      description: dummyText,
      image: 'assets/fanta.png',
      color: Colors.orange),
  Product(
      id: 3,
      title: "Pepsi",
      price: 234,
      description: dummyText,
      image: 'assets/pepsi.png',
      color: Colors.black),
  Product(
      id: 4,
      title: "Sprite",
      price: 234,
      description: dummyText,
      image: 'assets/Sprite.png',
      color: Colors.green),
];

String dummyText =
    'Get this Product asap from swish where we help you buy this product easily,quickly. scan this product from the comfort of your home to receive the nearest store near you that is selling the product and get it at a cheaper price';
