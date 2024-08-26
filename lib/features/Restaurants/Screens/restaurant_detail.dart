import 'package:flutter/material.dart';
import 'package:food_delivery/features/Restaurants/services/restaurant_service.dart';
import 'package:food_delivery/features/admin/services/admin_services.dart';

import 'package:food_delivery/models/product.dart';

class ResDetail extends StatefulWidget {
  final Map<String, dynamic> restau;
  final List<Product>? menu;
  final String restau_name;

  const ResDetail({
    super.key,
    required this.restau,
    required this.menu,
    required this.restau_name,
  });

  @override
  State<ResDetail> createState() => _ResDetailState();
}

class _ResDetailState extends State<ResDetail> {
  List<Product>? products;
  final AdminService adminServices = AdminService();
  final RestaurantDetailsServices restservice = RestaurantDetailsServices();

  @override
  void initState() {
    super.initState();
    products = [];
  }

  @override
  Widget build(BuildContext context) {
    //  products = widget.menu;
    bool flag = false;
    products = [];
    for (int i = 0; i < widget.menu!.length; i++) {
      if (widget.menu![i].admin_name == widget.restau_name) {
        for (int j = 0; i < products!.length; j++) {
          if (products![j].name == widget.menu![i].name) {
            flag = true;
          }
        }
        if (flag || products!.isEmpty) {
          products!.add(widget.menu![i]);
        }
      }
    }
    setState(() {});
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
              child: SizedBox(
                width: 420,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(height: 0),
                      hintText: "Search your Favorites dishes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset.zero,
                        blurRadius: 0.05,
                        spreadRadius: 0.01)
                  ],
                  // border: Border.all(),
                ),
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                  child: Column(
                    children: [
                      Text(
                        widget.restau_name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 65,
                          ),
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                          ),
                          Text(
                            "Pure Veg",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 85,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.star),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1K Rating",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                        child: Card(
                          color: Color.fromARGB(255, 238, 229, 203),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.watch_later_rounded),
                              Text('${2.7 * 8} mins '),
                              Text(
                                '${2.9} km',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 340,
              child: Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    index = index;
                    final productname = products![index].name;
                    final productprice = products![index].price;
                    final imagUrl = products![index].images[0];
                    return Container(
                      width: 110,
                      height: 160,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 180,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 4),
                                      child: Text(productname,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 4),
                                      child: Text('Rs ${productprice}',
                                          style: TextStyle()),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          restservice.addToCart(
                                              context: context,
                                              product: products![index]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            shadowColor: const Color.fromARGB(
                                                255, 242, 21, 6),
                                            side: BorderSide(
                                                width: 0.3,
                                                style: BorderStyle.solid),
                                            backgroundColor: Colors.white),
                                        child: Text(
                                          "Add to Cart",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: Image.network(
                                imagUrl,
                                height: 120,
                                width: 80,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
