import '../database/database_helper.dart';
import '../model/model.dart';

import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoView extends StatelessWidget {
  final int position;

  InfoView({Key? key, required this.position}) : super(key: key);
  final DatabaseHelper? db = DatabaseHelper.databaseHelper;

  @override
  Widget build(BuildContext context) {
    var product = productList[position];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${product.price.toDouble()} / ${product.unit}',
                      style: const TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              ),
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width * 0.25,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF348E4E),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Consumer<CartController>(
                  builder: (context, countController, child) => ElevatedButton(
                    onPressed: () async {
                      db!
                          .insertProduct(Product(
                              id: position + 1,
                              name: product.name,
                              image: product.image,
                              initialPrice: product.initialPrice,
                              price: product.price,
                              quantity: product.quantity,
                              unit: product.unit))
                          .then((value) {
                        countController.increaseTotalPrice(
                            double.parse('${product.price}'));
                        countController.increaseCounter();
                      });
                      countController.incrementProductItem();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, elevation: 0.0),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
