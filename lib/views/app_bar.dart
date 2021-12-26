import 'package:addtocart_sqflite_and_provider/database/database_helper.dart';

import '../controller/state_controller.dart';
import '../screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget appBar(BuildContext context) {
  String title = 'Golden Corral';
  return AppBar(
    title: Text(title),
    backgroundColor: const Color(0xFF2ECC71),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu),
    ),
    elevation: 0.0,
    actions: [
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0.0,
        ),
        onPressed: () async {
          await DatabaseHelper.databaseHelper.deleteDatabase();
        },
        icon: const Icon(Icons.filter_list_outlined),
        label: const Text('Filter'),
      ),
      InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => CartController(),
              child: const CartScreen(),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 10.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.add_shopping_cart_outlined, size: 30.0),
              Positioned(
                top: -6.0,
                right: 2.0,
                child: Container(
                  height: 18.0,
                  width: 18.0,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Consumer<CartController>(
                    builder: (context, count, child) => Text(
                      count.getCounter().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
