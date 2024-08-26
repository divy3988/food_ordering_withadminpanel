import 'package:flutter/material.dart';
import 'package:food_delivery/features/cart/screens/cart.dart';
import 'package:food_delivery/features/Homescreen/Screens/home_page.dart';
import 'package:food_delivery/features/Homescreen/Screens/restaurant.dart';

class HomeNav extends StatefulWidget {
  static const String routeName = '/home';
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int currentpage = 0;
  List<Widget> pages = [restaurant_home(), cart_page(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentpage = value;
            });
          },
          currentIndex: currentpage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.food_bank,
                ),
                label: '')
          ]),
    );
  }
}
