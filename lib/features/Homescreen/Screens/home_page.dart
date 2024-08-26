import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/Homescreen/Screens/Home_Navigation.dart';
import 'package:food_delivery/features/Homescreen/Screens/userdetail.dart';
import 'package:food_delivery/constants/global_variables.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(children: [
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
          child: GridView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage(foods[index]['imageurl'].toString()),
                ),
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return HomeNav();
              }));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
            ),
            child: const Padding(
              padding: const EdgeInsets.fromLTRB(50, 14, 50, 14),
              child: Text("Nearby Restaurants"),
            ),
          ),
        ),
      ]),
    );
  }
}
