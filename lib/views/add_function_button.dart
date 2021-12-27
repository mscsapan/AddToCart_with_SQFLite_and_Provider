import '../controller/state_controller.dart';

import '../model/model.dart';
import '../database/database_helper.dart';

addFunctionButton(Product product, CartController cartController) async {
  int item = product.quantity;
  int oldPrice = product.initialPrice;
  item++;
  int newPrice = item * oldPrice;
  await DatabaseHelper.databaseHelper
      .updateQuantity(
    Product(
      id: product.id,
      name: product.name,
      image: product.image,
      initialPrice: product.initialPrice,
      price: newPrice,
      unit: product.unit,
      quantity: item,
    ),
  )
      .then((value) {
    item = 0;
    newPrice = 0;
    cartController.increaseTotalPrice(product.initialPrice.toDouble());
  });
}
