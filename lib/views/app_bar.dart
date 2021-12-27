import '../database/database_helper.dart';

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
      IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete Database?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () async {
                      //await DatabaseHelper.databaseHelper.deleteDatabase();
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Database Delete Successfully'),
                        ),
                      );
                    },
                    child: const Text('Delete')),
              ],
              content:
                  const Text('If Press Delete, Whole Database\'ll be Delete'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        },
        icon: const Icon(Icons.delete),
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
              Consumer<CartController>(
                  builder: (context, count, _) => Visibility(
                        visible: count.counter == 0 ? false : true,
                        child: Positioned(
                          top: -6.0,
                          right: 2.0,
                          child: Container(
                            height: 18.0,
                            width: 18.0,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Text(
                              count.getCounter().toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
            ],
          ),
        ),
      ),
    ],
  );
}
