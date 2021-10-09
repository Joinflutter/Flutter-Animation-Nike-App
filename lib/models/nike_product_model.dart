import 'package:flutter/material.dart';

class NikeProduct {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeProduct(
      {required this.currentPrice,
      required this.images,
      required this.color,
      required this.model,
      required this.modelNumber,
      required this.oldPrice});
}

List<NikeProduct> nikeProduct = <NikeProduct>[
  NikeProduct(
    color: 0xfff6f6f6,
    currentPrice: 149,
    images: [
      'assets/images/shoes1_1.png',
      'assets/images/shoes1_2.png',
      'assets/images/shoes1_3.png',
    ],
    model: 'Air max 121 black',
    modelNumber: 121,
    oldPrice: 299,
  ),
  NikeProduct(
    color: 0xfffcf5eb,
    currentPrice: 299,
    images: [
      'assets/images/shoes2_1.png',
      'assets/images/shoes2_2.png',
      'assets/images/shoes2_3.png',
    ],
    model: 'Air max 270 gold',
    modelNumber: 270,
    oldPrice: 399,
  ),
  
  NikeProduct(
    color: 0xfffeefef,
    currentPrice: 246,
    images: [
      'assets/images/shoes3_1.png',
      'assets/images/shoes3_2.png',
      'assets/images/shoes3_3.png',
    ],
    model: 'Air max 219 red',
    modelNumber: 219,
    oldPrice: 313,
  ),
  NikeProduct(
    color: 0xffedf3fe,
    currentPrice: 270,
    images: [
      'assets/images/shoes4_1.png',
      'assets/images/shoes4_2.png',
      'assets/images/shoes4_3.png',
    ],
    model: 'Air max 125 blue',
    modelNumber: 125,
    oldPrice: 179,
  ),
];
