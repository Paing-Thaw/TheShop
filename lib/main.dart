import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
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
