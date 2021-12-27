import '../model/model.dart';
import 'package:flutter/material.dart';

import '../views/app_bar.dart';
import '../views/image_view.dart';
import '../views/info_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: ListView.builder(
          itemCount: productList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, position) => Container(
            height: height * 0.16,
            width: width,
            //color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                ImageView(position: position),
                InfoView(position: position),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
