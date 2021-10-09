import 'package:flutter/material.dart';

class CustomFBA extends StatelessWidget {
  const CustomFBA({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
        ));
  }
}
