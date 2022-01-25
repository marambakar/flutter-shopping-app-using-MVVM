import 'package:alayniah/data/categories_data.dart';
import 'package:alayniah/models/product.dart';
import 'package:flutter/material.dart';

List<Product> favProduct =products.where((product) => product.isfav).toList();
// [
//   // Product(
//   //     id: 1,
//   //     name: "dates1",
//   //     price: 234,
//   //     description:
//   //     "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
//   //     image: "images/pro1.png",
//   //     isfav: true,
//   //     quantity: 100),
//   // Product(
//   //     id: 2,
//   //     name: "dates2",
//   //     price: 234,
//   //     description:
//   //     "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
//   //     image: "images/pro2.png",
//   //     isfav: true,
//   //     quantity: 100),
//   // Product(
//   //     id: 3,
//   //     name: "dates3",
//   //     price: 234,
//   //     description:
//   //     "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
//   //     image: "images/pro2.png",
//   //     isfav: true,
//   //     quantity: duct(
//   //   //     id: 4,
//   //   //     name: "dates4",
//   //   //     price: 234,
//   //   //     description:
//   //   //     "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
//   //   //     image: "images/pro3.png",
//   //   //     isfav: true,
//   //   //     quantity: 100)100),
//   // Pro,
// ];
List<Product> products = [
  Product(
      id: 1,
      name: "dates1",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: true,
      quantity: 100,
      category: categories[0]
      ,subCategory: 1
  ),
  Product(
      id: 2,
      name: "dates2",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_1.jpg",
      isfav: true,
      quantity: 100,
      category: categories[0],
      subCategory: 1),
  Product(
      id: 3,
      name: "dates3",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_3.jpg",
      isfav: true,
      quantity: 100,
      category: categories[1],
      subCategory: 4),
  Product(
      id: 4,
      name: "dates4",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_1.jpg",
      isfav: true,
      quantity: 100,
      category: categories[2]),
  Product(
      id: 5,
      name: "dates5",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_3.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 6,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 7,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 8,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 9,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 10,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),
  Product(
      id: 11,
      name: "dates6",
      price: 234,
      description:
      "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      image: "assets/images/img_store_2.jpg",
      isfav: false,
      quantity: 100,
      category: categories[0],
      subCategory: 2),

];
