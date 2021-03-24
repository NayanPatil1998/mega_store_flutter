import 'package:flutter/material.dart';
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
              height: 30,
            ),
            VStack(
              [
                "Welcome to Login".text.center.bold.black.xl2.make().centered(),
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
                  )
                ],
              ),
            ))
                .width(size.width * 0.8)
                .padding(EdgeInsets.symmetric(vertical: 10))
                .margin(
                  EdgeInsets.symmetric(vertical: 25),
                )
                .make()
                .centered()
          ],
        ).py24(),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    this.size,
    this.hintText,
    this.icon,
    this.secured,
    this.onChanged,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final IconData icon;
  final bool secured;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: HStack(
        [
          VxBox(
            child: Icon(
              icon,
              color: Vx.gray600,
            ).centered(),
          ).height(50).width(50).border(color: Vx.gray300).make(),
          Expanded(
            child: TextFormField(
              obscureText: secured,
              onChanged: onChanged,
              cursorColor: Vx.gray800,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                focusColor: Vx.gray800,
              ),
            ),
          )
        ],
      ),
    )
        .border(color: Vx.gray400)
        .height(50)
        .width(size.width)
        .margin(EdgeInsets.only(bottom: 10))
        .make();
  }
}
