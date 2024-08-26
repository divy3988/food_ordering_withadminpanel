import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants/global_variables.dart';
import 'package:food_delivery/features/admin/screens/Post_screen.dart';
import 'package:food_delivery/features/admin/screens/analytics_screen.dart';
import 'package:food_delivery/features/admin/screens/orders_screen.dart';
import 'package:food_delivery/features/auth/screens/auth_screen.dart';

class adminS extends StatefulWidget {
  const adminS({super.key});

  @override
  State<adminS> createState() => _adminSState();
}

class _adminSState extends State<adminS> {
  int _page = 0;
  var bottomBarWidth = 42.0;
  var bottomBarBorderWidth = 5.0;

  List<Widget> pages = [
    const PostsScreen(),
    const AnalyticsScreen(),
    const OrdersScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const AuthScreen();
                      }));
                    });
                  },
                  child: Text("Log-Out"),
                )),
          )
        ],
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // POSTS
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? globalvariable.selectedNavBarColor
                        : globalvariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? globalvariable.selectedNavBarColor
                        : globalvariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? globalvariable.selectedNavBarColor
                        : globalvariable.backgroundColor,
                    width: 5,
                  ),
                ),
              ),
              child: const Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
