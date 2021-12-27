import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget cartAppBar(BuildContext context) => AppBar(
      elevation: 0.0,
      backgroundColor: const Color(0xFF2ECC71),
      title: const Text('My Cart'),
      actions: [
        Padding(
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
        )
      ],
      centerTitle: true,
    );
