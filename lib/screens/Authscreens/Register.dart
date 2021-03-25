import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mega_store/widgets/ButtonWidget.dart';
import 'package:mega_store/widgets/TextFieldContainer.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "Welcome to Register"
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
                  "Please enter below details to register \n  your account"
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
                        hintText: "Name",
                        secured: false,
                        icon: Icons.person,
                        onChanged: (value) => {},
                      ),
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
                        buttonText: "Register",
                        size: size,
                      ),
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
              "Or Register with:".text.gray400.make().centered(),
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
              "Have an account? Login".text.black.medium.make().centered()
            ],
          ).py24().scrollVertical()),
    );
  }
}
