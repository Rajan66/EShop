import 'package:flutter/material.dart';

class Product {
  final String image, title,category;
  final int price, stock, id,date;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.stock,
    required this.date
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      stock: 12,
      category: dummyText,
      image: "assets/images/bag_1.png",
      date: 1640071754736
    ),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      stock: 8,
      category: dummyText,
      image: "assets/images/bag_2.png",
      date: 1640071754736
    ),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      stock: 10,
      category: dummyText,
      image: "assets/images/bag_3.png",
      date: 1640071754736
    ),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      stock: 11,
      category: dummyText,
      image: "assets/images/bag_4.png",
      date: 1640071754736
    ),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      stock: 12,
      category: dummyText,
      image: "assets/images/bag_5.png",
      date: 1640071754736
      ),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    stock: 12,
    category: dummyText,
    image: "assets/images/bag_6.png",
    date: 1640071754736
  ),
];

String dummyText =
    "Laptop";
