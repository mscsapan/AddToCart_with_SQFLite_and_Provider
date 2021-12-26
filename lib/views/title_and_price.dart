import 'package:flutter/material.dart';

class TitleAndPrice extends StatelessWidget {
  final String title;
  final String price;
  final String unit;

  const TitleAndPrice(
      {Key? key, required this.title, required this.price, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toString(),
          style: const TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w400, letterSpacing: 1.4),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '$price /', style: const TextStyle(color: Colors.black)),
          TextSpan(text: unit, style: const TextStyle(color: Colors.black)),
        ]))
      ],
    );
  }
}
