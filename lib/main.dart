import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/home_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (_) => CartController(), child: const HomeScreen()),
        title: 'AddToCart With SQFLite and Provider',
      ),
    );
