import 'package:addtocart_sqflite_and_provider/controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final String title = 'Golden Corral';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {},
              icon: const Icon(Icons.filter_list_outlined),
              label: const Text('Filter')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: ListView.builder(
          itemCount: 26,
          itemBuilder: (context, position) => Container(
            height: height * 0.16,
            width: width,
            //color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Container(
                  height: height * 0.16,
                  width: width * 0.28,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/product/${position + 1}.png'),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Fresh Red Apple',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF348E4E),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: position % 2 == 0
                                ? Consumer<CartController>(
                                    builder: (context, cartController, _) =>
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => cartController
                                                  .decrementProductItem(),
                                              child: const Icon(Icons.remove,
                                                  size: 20.0,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                                color: Colors.white,
                                                alignment: Alignment.center,
                                                width: 34.0,
                                                height: 40.0,
                                                child: Text(
                                                  cartController.count
                                                      .toString()
                                                      .padLeft(2, '0'),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                )),
                                            InkWell(
                                              onTap: () => cartController
                                                  .incrementProductItem(),
                                              child: const Icon(Icons.add,
                                                  size: 20.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ))
                                : const Text(
                                    'Add',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18.0),
                                  ),
                          ),
                        ],
                      )
                    ],
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
