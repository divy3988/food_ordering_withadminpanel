import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_button.dart';

class Start_Screen extends StatelessWidget {
  const Start_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomButton(text: " Admin ", onTap: () {}),
          CustomButton(text: " User ", onTap: () {})
        ],
      ),
    );
  }
}
