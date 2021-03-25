import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mega_store/screens/Home.dart';
import 'package:mega_store/widgets/ButtonWidget.dart';
import 'package:mega_store/widgets/TextFieldContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  child: VStack(
                    [
                      TextFieldWidget(
                        size: size,
                        hintText: "Email",
                        secured: false,
                        icon: Icons.email,
                        onChanged: (value) => {},
                      ),
                      TextFieldWidget(
                        size: size,
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
                        onPressed: () {},
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
