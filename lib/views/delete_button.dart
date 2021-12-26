import '../controller/state_controller.dart';
import '../database/database_helper.dart';
import '../model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final Product product;

  const DeleteButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, _) => IconButton(
        onPressed: () async {
          DatabaseHelper.databaseHelper.deleteItem(product.id).then(
            (value) {
              cartController.decreaseCounter();
              cartController.decreaseTotalPrice(
                product.price.toDouble(),
              );
            },
          );
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
