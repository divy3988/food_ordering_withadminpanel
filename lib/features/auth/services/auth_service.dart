import 'package:flutter/material.dart';
import 'package:food_delivery/constants/error_handling.dart';
import 'package:food_delivery/constants/utils.dart';
import 'package:food_delivery/features/Homescreen/Screens/Home_Navigation.dart';
import 'package:food_delivery/features/admin/screens/admin.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/constants/global_variables.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  // ignore: non_constant_identifier_names
  void SignupUser({
    required BuildContext context,
    required String emai,
    required String passwor,
    required String nam,
    required String type,
  }) async {
    try {
      User user = User(
          id: '',
          name: nam,
          email: emai,
          password: passwor,
          address: '',
          type: type,
          token: '',
          cart: []);
      print(nam);
      var res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          // ignore: use_build_context_synchronously
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created Successfully');
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  void SignInUser({
    required BuildContext context,
    required String emai,
    required String passwor,
  }) async {
    try {
      var res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': emai, 'password': passwor}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          // ignore: use_build_context_synchronously
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            if (res.body.contains('user')) {
              Navigator.pushNamed(context, HomeNav.routeName);
            } else {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const adminS();
              }));
            }
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/istokenvalid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<User>> admindata(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<User> userList = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/adminuser'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return userList;
  }
}
