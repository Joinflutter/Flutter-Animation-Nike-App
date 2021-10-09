import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nike_app/models/nike_product_model.dart';
import 'package:nike_app/screens/details_screen.dart';

class NikeHomeScreen extends StatelessWidget {
  NikeHomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> notifireBottomBarVisible = ValueNotifier(true);

  void _onShoesPress(index) async {
    notifireBottomBarVisible.value = false;
    await Get.to(
      () => DetailsScreen(
        shoes: nikeProduct[index],
      ),
      transition: Transition.fadeIn,
    );
    notifireBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: SizedBox(
            height: size.height * 0.07,
            child: Image.asset('assets/images/nike_logo.png'),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 65),
              physics: const BouncingScrollPhysics(),
              itemCount: nikeProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItems(
                  onTap: () {
                    _onShoesPress(index);
                  },
                  size: size,
                  index: index,
                );
              },
            ),
            ValueListenableBuilder<bool>(
                valueListenable: notifireBottomBarVisible,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(FeatherIcons.home, color: Colors.black),
                      Icon(FeatherIcons.search, color: Colors.grey.shade600),
                      Icon(FeatherIcons.heart, color: Colors.grey.shade600),
                      Icon(
                        FeatherIcons.shoppingBag,
                        color: Colors.grey.shade600,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.shade600,
                        backgroundImage: const NetworkImage(
                            'https://img.freepik.com/free-photo/handsome-young-man-with-new-stylish-haircut_176420-19637.jpg?size=626&ext=jpg'),
                      )
                    ],
                  ),
                ),
                builder: (BuildContext context, bool value, dynamic child) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 220),
                    bottom: value ? 0 : -50,
                    left: 0,
                    right: 0,
                    child: child,
                  );
                })
          ],
        ),
      ),
    );
  }
}

class ProductItems extends StatelessWidget {
  const ProductItems({
    Key? key,
    required this.size,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: 10,
          ),
          // height: size.height * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(nikeProduct[index].color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -15,
                child: Hero(
                  tag: 'nimber_${nikeProduct[index].modelNumber}',
                  child: SizedBox(
                    width: size.width * 0.6,
                    height: size.height * 0.2,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          nikeProduct[index].modelNumber.toString(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(.04),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: size.height * 0.015),
                  Hero(
                    tag: 'image_${nikeProduct[index].model}',
                    child: Image.asset(
                      nikeProduct[index].images.first,
                      fit: BoxFit.cover,
                      width: size.width * 0.55,
                    ),
                  ),
                  Text(
                    nikeProduct[index].model.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Text(
                    '\$${nikeProduct[index].oldPrice.toString()}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(FeatherIcons.heart),
                      Text(
                        '\$${nikeProduct[index].currentPrice.toString()}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      const Icon(FeatherIcons.shoppingBag),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
