import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key, this.size, this.buttonText, this.color})
      : super(key: key);

  final Size size;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: buttonText.text
                .color(color == Colors.black ? Colors.white : Colors.black)
                .make()
                .centered())
        .height(50)
        .width(size.width * 0.85)
        .border()
        .margin(EdgeInsets.only(bottom: 15))
        .color(color)
        .makeCentered();
  }
}
