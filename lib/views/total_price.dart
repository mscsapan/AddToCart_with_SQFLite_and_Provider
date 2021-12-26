import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, price, _) => Visibility(
        visible: price.getTotalPrice().toDouble() == 0.0 ? false : true,
        child: Container(
          height: 60.0,
          width: double.infinity,
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Item Price',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Text(
                  '\$${price.getTotalPrice().toDouble()}',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
