import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/utilities.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiver/strings.dart';
import 'package:flutter_app/services/auth_services.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController email = TextEditingController();
  final AuthServices authService = AuthServices();
  TextEditingController password = TextEditingController();
  TextEditingController conform = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: email.text,
      password: password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(email);
    print(password);
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              emailTextFormField(),
              SizedBox(
                height: 30,
              ),
              passwordTextFormField(),
              SizedBox(
                height: 30,
              ),
              conformTextFormField(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(
                          context,
                          User(
                              email: email.text,
                              password: conform.text,
                              id: "",
                              token: ""));
                    }
                    signUpUser();
                  },
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
                height: 30,
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
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/google-icon.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/twitter.svg"),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined),
      ),
      validator: Utilities.validateEmail,
      onSaved: (value) {
        setState(() {
          email.text = value!;
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline),
      ),
      validator: (passwordKey) {
        return Utilities.validatePassword(passwordKey!);
      },
    );
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      controller: conform,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline),
      ),
      validator: (conformPassword) {
        var pass = _passKey.currentState?.value;
        return Utilities.confirmPassword(conformPassword!, pass);
      },
      onSaved: (value) {
        setState(() {
          conform.text = value!;
        });
      },
    );
  }
}
