import 'package:flutter/material.dart';
import 'package:food_delivery/features/Homescreen/Screens/Home_Navigation.dart';
import 'package:food_delivery/features/admin/screens/add_products.dart';
import 'package:food_delivery/features/auth/screens/auth_screen.dart';
import 'package:food_delivery/models/product.dart';

Product product = Product(
    name: '',
    admin_name: '',
    description: 'description',
    images: ['assets/images/noodles.png'],
    category: 'category',
    price: 200.0);
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeNav.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeNav(),
      );
    case AddProducts.route_name:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProducts(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
