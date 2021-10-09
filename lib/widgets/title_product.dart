import 'package:flutter/material.dart';
import 'package:nike_app/models/nike_product_model.dart';


class TitleProductAndPrice extends StatelessWidget {
  const TitleProductAndPrice({
    Key? key,
    required this.shoes,
    required this.size,
  }) : super(key: key);

  final NikeProduct shoes;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            shoes.model.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${shoes.oldPrice.toInt().toString()}',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.045,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                '\$${shoes.currentPrice.toInt().toString()}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.06,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
