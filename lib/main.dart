import 'package:flutter/material.dart';
import 'package:food_delivery/features/Homescreen/Screens/Home_Navigation.dart';
import 'package:food_delivery/features/admin/screens/admin.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:food_delivery/Home_Navigation.dart';
import 'package:food_delivery/features/auth/screens/auth_screen.dart';
import 'package:food_delivery/features/auth/services/auth_service.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:food_delivery/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const HomeNav()
                : const adminS()
            : const AuthScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
        theme: ThemeData(
            textTheme: const TextTheme(
                titleMedium:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                titleLarge:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 226, 78, 76)),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 155, 47, 40)),
            scaffoldBackgroundColor: Colors.white));
  }
}
