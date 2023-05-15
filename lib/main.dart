import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'providers/products.dart';
import 'providers/cart.dart';
import 'package:shop/screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => Products()),
      ChangeNotifierProvider(
          create: (context) => Cart() ),
    ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF486860),
            secondary: const Color(0xFFF38064),
            surface: const Color(0xFF23322F),

          ),

        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MyShop'),
//       ),
//       body: Center(
//         child: Text('Let\'s build an app'),
//       ),
//     );
//   }
// }
//
