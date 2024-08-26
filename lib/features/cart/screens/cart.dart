import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/constants/utils.dart';
import 'package:food_delivery/features/Homescreen/Screens/userdetail.dart';
import 'package:food_delivery/features/address/adddress_screen.dart';
import 'package:food_delivery/features/cart/widgets/cart_product.dart';
import 'package:food_delivery/features/cart/widgets/cart_subtotal.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UserDetail();
                }));
              },
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/avatar.png',
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          CartSubtotal(),
          CustomButton(
              text: "Proceed to Buy (${user.cart.length} items)",
              onTap: () {
                if (user.cart.length > 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AddressScreen(totalAmount: sum.toString());
                  }));
                } else {
                  showSnackBar(context, "Please Add Prduct to your Cart");
                }
              }),
          ListView.builder(
              shrinkWrap: true,
              itemCount: user.cart.length,
              itemBuilder: (context, index) {
                return CartProduct(index: index);
              })
        ],
      ),
    );
  }
}
