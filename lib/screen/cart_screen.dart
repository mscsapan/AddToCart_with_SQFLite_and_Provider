import '../views/add_function_button.dart';
import '../views/remove_function_button.dart';

import '../views/delete_button.dart';

import '../views/total_price.dart';
import '../views/cart_app_bar.dart';

import '../views/empty_product.dart';

import '../views/cart_images.dart';
import '../views/title_and_price.dart';
import '../views/count_button.dart';

import '../model/model.dart';

import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final cartController = Provider.of<CartController>(context, listen: true);
    return Scaffold(
        appBar: cartAppBar(context),
        body: SizedBox(
          height: height,
          width: width,
          child: FutureBuilder<List<Product>>(
            future: cartController.getAllQueryProduct(),
            builder: (context, AsyncSnapshot<List<Product>> queryProduct) {
              if (queryProduct.data == null || queryProduct.data!.isEmpty) {
                return const EmptyProduct();
              } else {
                return queryProduct.hasData
                    ? ListView.builder(
                        itemCount: queryProduct.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          var product = queryProduct.data![position];
                          return Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 6.0),
                            child: Container(
                              height: height * 0.18,
                              width: width,
                              //color: Colors.red,
                              margin: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                children: [
                                  CartImage(
                                    height: height,
                                    width: width,
                                    image: product.image.toString(),
                                  ),
                                  SizedBox(
                                    //color: Colors.red,
                                    height: height * 0.8,
                                    width: width * 0.66,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TitleAndPrice(
                                                title: product.name,
                                                price:
                                                    '${product.price.toDouble()}',
                                                unit: product.unit),
                                            DeleteButton(product: product),
                                          ],
                                        ),
                                        CountButton(
                                          width: width,
                                          quantity: product.quantity.toString(),
                                          addTap: () => addFunctionButton(
                                              product, cartController),
                                          removeTap: () => removeFunctionButton(
                                              product, cartController),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        bottomNavigationBar: const TotalPrice());
  }
}
