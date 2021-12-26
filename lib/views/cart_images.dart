import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const CartImage(
      {Key? key,
      required this.height,
      required this.width,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      width: width * 0.26,
      margin: const EdgeInsets.all(6.0),
      child: Image.asset(
        image.toString(),
        fit: BoxFit.fill,
      ),
    );
  }
}
