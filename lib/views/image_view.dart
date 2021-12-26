import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final int position;
  const ImageView({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.16,
      width: width * 0.28,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset('assets/product/${position + 1}.png'),
      ),
    );
  }
}
