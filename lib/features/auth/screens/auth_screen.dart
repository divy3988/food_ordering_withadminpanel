import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/services/auth_service.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/common/custom_textfields.dart';
import 'package:food_delivery/constants/global_variables.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _typecontroller = TextEditingController();

  void signinUser() {
    authService.SignInUser(
      context: context,
      emai: _emailcontroller.text,
      passwor: _passwordcontroller.text,
    );
  }

  void signUpUser() {
    print(_emailcontroller.text);
    authService.SignupUser(
        context: context,
        emai: _emailcontroller.text,
        passwor: _passwordcontroller.text,
        nam: _namecontroller.text,
        type: _typecontroller.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: globalvariable.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8, 8, 8),
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? globalvariable.backgroundColor
                    : globalvariable.greyBackgroundCOlor,
                title: Text("Create Account"),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _namecontroller,
                          text: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailcontroller,
                          text: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordcontroller,
                          text: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _typecontroller,
                          text: "Admin/User",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (_signupFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? globalvariable.backgroundColor
                    : globalvariable.greyBackgroundCOlor,
                title: Text("Sign In"),
                leading: Radio(
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailcontroller,
                          text: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordcontroller,
                          text: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Sign In",
                          onTap: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signinUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
