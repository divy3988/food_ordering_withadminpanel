import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/Restaurants/Screens/restaurant_detail.dart';
import 'package:food_delivery/features/Homescreen/Screens/userdetail.dart';
import 'package:food_delivery/constants/global_variables.dart';
import 'package:food_delivery/features/admin/services/admin_services.dart';
import 'package:food_delivery/features/auth/services/auth_service.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class restaurant_home extends StatefulWidget {
  const restaurant_home({super.key});

  @override
  State<restaurant_home> createState() => _restaurant_homeState();
}

class _restaurant_homeState extends State<restaurant_home> {
  List<User>? restaurants;
  List<Product>? productts;
  List<Product>? products = [];
  final AdminService adminServices = AdminService();

  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getadmindata();
    getAllProducts();
  }

  getAllProducts() async {
    productts = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  getadmindata() async {
    restaurants = await authService.admindata(context) as List<User>?;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: AppBar(
        title: Text(address,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal)),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return UserDetail();
                }));
              },
              child: const CircleAvatar(
                radius: 50,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: SizedBox(
              width: 420,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(height: 0),
                    hintText: "Search your Favorites dishes",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Container(
                child: ListView.builder(
                    itemCount: restaurants!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final restau_name = restaurants![index].name;

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (Context) {
                            return ResDetail(
                                menu: productts,
                                restau: restaurants_count[index],
                                restau_name: restau_name);
                          }));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                restaurants_count[index]['imageurl'].toString(),
                                height: 150,
                                width: 300,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 4, 4),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    restaurants![index].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 1, 4, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        "4.6",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
