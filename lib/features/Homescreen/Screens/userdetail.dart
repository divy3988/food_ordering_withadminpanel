import 'package:flutter/material.dart';
import 'package:food_delivery/features/Homescreen/Screens/Home_Navigation.dart';
import 'package:food_delivery/features/auth/screens/auth_screen.dart';
import 'package:food_delivery/features/auth/services/auth_service.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 29,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return HomeNav();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18, 30, 10, 30),
                    child: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      foregroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Provider.of<UserProvider>(context).user.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                Provider.of<UserProvider>(context).user.email)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.supervised_user_circle),
                      title: Text(
                        "Your Profile",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.menu_book),
                      title: Text(
                        "Your Order",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        "Address Book",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        "Settings",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.feedback),
                      title: Text(
                        "FeedBack",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text(
                        "About",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.arrow_circle_right_sharp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Card(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return AuthScreen();
                        }));
                      },
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          "Log out",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Icon(Icons.arrow_circle_right_sharp),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
