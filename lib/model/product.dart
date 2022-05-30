import 'package:flutter/material.dart';

class ProductData {
  int? id;
  String image;
  String? title;
  String? content;
  int? price;
  int? seller;

  ProductData({ 
    this.id, 
    this.image = "", 
    this.title, 
    this.content, 
    this.price, 
    this.seller});
}
