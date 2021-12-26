import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  final double width;
  final Function() addTap, removeTap;
  final String quantity;

  const CountButton(
      {Key? key,
      required this.width,
      required this.addTap,
      required this.quantity,
      required this.removeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 40.0,
        width: width * 0.34,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: removeTap,
                icon: const Icon(Icons.remove, color: Colors.white)),
            Text(
              quantity,
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            IconButton(
                onPressed: addTap,
                icon: const Icon(Icons.add, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
