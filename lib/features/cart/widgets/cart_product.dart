import 'package:flutter/material.dart';
import 'package:food_delivery/features/Restaurants/services/restaurant_service.dart';
import 'package:food_delivery/features/cart/services/cart_services.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({super.key, required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final RestaurantDetailsServices Services = RestaurantDetailsServices();
  CartServices cartServices = CartServices();
  void increaseQuantity(Product product) {
    Services.increaseCart(
      context: context,
      product: product,
    );
  }

  void decQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Container(
                height: 135,
                width: 135,
              ),
              Column(children: [
                Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 120,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '\Rs ${product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => decQuantity(product),
                          child: Container(
                            width: 35,
                            height: 32,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 1.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            width: 35,
                            height: 32,
                            alignment: Alignment.center,
                            child: Text(
                              quantity.toString(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => increaseQuantity(product),
                          child: Container(
                            width: 35,
                            height: 32,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
