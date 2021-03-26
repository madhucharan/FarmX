import 'package:flutter/material.dart';

class Product {
  final String image, title, description, type;
  final int price, id;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.type,
  });
}

List<Product> products = [
  Product(
    id: 1,
    image: "assets/images/rice1.png",
    title: "Rice",
    price: 123,
    description: dummyText,
    type: "paddy",
  ),
  Product(
    id: 2,
    title: "Rice",
    price: 123,
    type: "paddy",
    image: "assets/images/rice2.png",
    description: dummyText,
  ),
  Product(
    id: 3,
    title: "Wheat",
    price: 123,
    type: "wheat",
    description: dummyText,
    image: "assets/images/wheat.png",
  ),
  Product(
    id: 4,
    title: "Corn",
    price: 123,
    type: 'Corn',
    description: dummyText,
    image: "assets/images/cornimage.png",
  ),
  Product(
    id: 5,
    title: "Cotton",
    price: 123,
    type: 'Cotton',
    description: dummyText,
    image: "assets/images/cotton1.png",
  ),
  Product(
    id: 6,
    title: "Fruits",
    price: 123,
    type: 'Fruits',
    description: dummyText,
    image: "assets/images/allfruits.png",
  ),
  Product(
    id: 7,
    title: "Vegetables",
    price: 123,
    type: 'vegetables',
    description: dummyText,
    image: "assets/images/veg.png",
  ),
  Product(
    id: 8,
    title: "Tomato",
    price: 123,
    type: 'vegetables',
    description: dummyText,
    image: "assets/images/tomato1.png",
  ),
  Product(
    id: 9,
    title: "Grains",
    price: 123,
    type: 'wholegrains',
    description: dummyText,
    image: "assets/images/grains.png",
  ),
  Product(
    id: 10,
    title: "DryFruits",
    price: 123,
    type: 'dryfruits',
    description: dummyText,
    image: "assets/images/dry.png",
  ),
  Product(
    id: 11,
    title: "Cashew",
    price: 123,
    type: 'dryfruits',
    description: dummyText,
    image: "assets/images/cashew.png",
  ),
  Product(
    id: 12,
    title: "Almond",
    price: 123,
    type: 'dryfruits',
    description: dummyText,
    image: "assets/images/almonds.png",
  ),
  Product(
    id: 13,
    title: "Kissmiss",
    price: 123,
    type: 'dryfruits',
    description: dummyText,
    image: "assets/images/kissmiss.png",
  ),
];

String dummyText =
    "It is basically a simple dummy text.U can buy this item and this is the item from the farmer.U are buying at your covinience.Thank you in advance";
