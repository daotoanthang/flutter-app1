import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/homepage/homepage.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/utilities.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/services/auth_services.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthServices authService = AuthServices();
  bool _value = false;
  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();
  // late FToast fToast; // diff
  FToast? fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
    _getData();
  }


  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: username.text,
      password: password.text,
    );
  }

  void _getData() async {
    // prefs = await SharedPreferences.getInstance();
    // if (!prefs.getString('username').isEmpty) {
    //   username.text = prefs.getString('username');
    //   password.text = prefs.getString('password');
    //   _value = prefs.getBoolean('check');
    // }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Food Now",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "Sign in with your email and password \nor continue with social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator: (value) {
                          return Utilities.validatePassword(value!); 
                        },
                        onSaved: (_value) {
                          setState(() {
                            username.text = _value!;
                          });
                        },
                        controller: username,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Username",
                            prefixIcon:
                                Icon(Icons.mail_outline_outlined) // diffff
                            ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          return Utilities.validatePassword(value!);
                        },
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outline_rounded)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            // signInUser();
                            // if (_value) {
                            //   prefs = await SharedPreferences.getInstance();
                            //   prefs.setString('username', username.text);
                            //   prefs.setString('password', password.text);
                            //   prefs.setBool('check', _value);
                            // } else {
                            //   prefs.remove('check');
                            // }
                            // Navigator.pushNamed(context, "/home");
                            if (_formKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                          // color: Colors.green,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                  "assets/icons/facebook-2.svg"),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                  "assets/icons/google-icon.svg"),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  shape: BoxShape.circle),
                              child:
                                  SvgPicture.asset("assets/icons/twitter.svg"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                          GestureDetector(
                              onTap: () async {
                                final result =
                                    await Navigator.pushNamed(context, "/up");
                                // User user = result;
                                // username.text = user.username;
                              },
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 14)))
                        ],
                      )
                    ],
                  )))
            ],
          )),
    );
  }
}
