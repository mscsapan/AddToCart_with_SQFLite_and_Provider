import 'package:flutter/material.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/product/empty_cart.png'),
          const Text(
            'No Product Available 😔',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
