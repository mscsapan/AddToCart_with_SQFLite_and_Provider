import '../views/delete_button.dart';

import '../views/total_price.dart';

import '../views/empty_product.dart';

import '../views/cart_images.dart';
import '../views/title_and_price.dart';
import '../views/count_button.dart';

import '../database/database_helper.dart';

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
        appBar: AppBar(
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
              )
            ],
            centerTitle: true),
        body: SizedBox(
          height: height,
          width: width,
          child: FutureBuilder<List<Product>>(
            future: cartController.getAllQueryProduct(),
            builder: (context, AsyncSnapshot<List<Product>> queryProduct) {
              if (queryProduct.data == null) {
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
                                                  '${product.initialPrice.toDouble()}',
                                              unit: product.unit,
                                            ),
                                            DeleteButton(product: product),
                                          ],
                                        ),
                                        CountButton(
                                          width: width,
                                          quantity: product.quantity.toString(),
                                          addTap: () async {
                                            int itemQuantity = product.quantity;
                                            int oldPrice = product.price;
                                            itemQuantity++;
                                            int newPrice =
                                                itemQuantity * oldPrice;
                                            await DatabaseHelper.databaseHelper
                                                .updateQuantity(Product(
                                              id: product.id,
                                              name: product.name,
                                              image: product.image,
                                              initialPrice:
                                                  product.initialPrice,
                                              price: newPrice,
                                              unit: product.unit,
                                              quantity: itemQuantity,
                                            ))
                                                .then(
                                              (value) {
                                                itemQuantity = 0;
                                                newPrice = 0;
                                                cartController
                                                    .increaseTotalPrice(
                                                  product.initialPrice
                                                      .toDouble(),
                                                );
                                              },
                                            );
                                          },
                                          removeTap: () async {
                                            int itemQuantity = product.quantity;
                                            int oldPrice = product.price;
                                            itemQuantity--;
                                            if (itemQuantity > 0) {
                                              int newPrice =
                                                  itemQuantity * oldPrice;
                                              await DatabaseHelper
                                                  .databaseHelper
                                                  .updateQuantity(
                                                Product(
                                                  id: product.id,
                                                  name: product.name,
                                                  image: product.image,
                                                  initialPrice:
                                                      product.initialPrice,
                                                  price: newPrice,
                                                  unit: product.unit,
                                                  quantity: itemQuantity,
                                                ),
                                              )
                                                  .then(
                                                (value) {
                                                  itemQuantity = 0;
                                                  newPrice = 0;
                                                  cartController
                                                      .decreaseTotalPrice(
                                                    product.initialPrice
                                                        .toDouble(),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        )
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
