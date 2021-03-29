import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mega_store/screens/Home.dart';
import 'package:mega_store/services/AuthService.dart';
import 'package:mega_store/widgets/ButtonWidget.dart';
import 'package:mega_store/widgets/TextFieldContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String email = '';
  String password = '';
  bool loading = false;

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
      print(email + " " + password);
      setState(() {
        loading = true;
      });
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
      dynamic result = await _auth.signInwithEmail(email, password);
      if (result != null) {
        if (result is FirebaseAuthException) {
          setState(() {
            loading = false;
          });
        }
        setState(() {
          loading = false;
        });
      }
//      print(result.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          child: VStack(
            [
              SizedBox(
                height: 30,
              ),
              "Mega Store"
                  .text
                  .center
                  .xl4
                  // .textStyle(GoogleFonts.dmSerifText())
                  .black
                  .make()
                  .centered(),
              SizedBox(
                height: 50,
              ),
              VStack(
                [
                  "Welcome to Login"
                      .text
                      .center
                      .bold
                      .black
                      .xl2
                      .make()
                      .centered(),
                  SizedBox(
                    height: 10,
                  ),
                  "Please enter below details to login \n to your account"
                      .text
                      .center
                      .gray700
                      .medium
                      .make()
                      .centered(),
                ],
              ),
              VxBox(
                child: Form(
                  key: _formKey,
                  // ignore: deprecated_member_use
                  autovalidateMode: _autoValidate,
                  child: VStack(
                    [
                      TextFieldWidget(
                        validator: (input) =>
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(input)
                                ? null
                                : "*Enter a valid email",
                        size: size,
                        hintText: "Email",
                        secured: false,
                        icon: Icons.email,
                        onChanged: (value) => {},
                      ),
                      TextFieldWidget(
                        size: size,
                        validator: (input) =>
                            RegExp(r"^[a-zA-Z0-9\s,-]{6,}").hasMatch(input)
                                ? null
                                : "*Enter a valid password",
                        hintText: "Password",
                        secured: true,
                        icon: Icons.lock,
                        onChanged: (value) => {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                        color: Colors.black,
                        onPressed: () {
                          _validateInputs();
                        },
                        buttonText: "Login",
                        size: size,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: "Forgot Password ?"
                            .text
                            .black
                            .bold
                            .medium
                            .make()
                            .centered(),
                      )
                    ],
                  ),
                ),
              )
                  .width(size.width * 0.8)
                  .padding(EdgeInsets.symmetric(vertical: 10))
                  .margin(
                    EdgeInsets.symmetric(vertical: 40),
                  )
                  .make()
                  .centered(),
              "Or Login with:".text.gray400.make().centered(),
              HStack(
                [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Vx.red200,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Zocial.google,
                            size: 16,
                            color: Vx.red700,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          "Google".text.red500.make()
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: MaterialButton(
                          onPressed: () {},
                          color: Vx.blue200,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Zocial.facebook,
                                size: 16,
                                color: Vx.blue700,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              "Facebook".text.blue500.make()
                            ],
                          )),
                    ),
                  )
                ],
              ).py24().px24(),
              "Didn't have an account? Create Account"
                  .text
                  .black
                  .medium
                  .make()
                  .centered()
            ],
          ).py24().scrollVertical()),
    );
  }
}
