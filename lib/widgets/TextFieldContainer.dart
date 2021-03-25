import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
          ).height(50).width(50).border(color: Vx.gray100).make(),
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
        .border(color: Vx.gray200)
        .height(50)
        .width(size.width)
        .margin(EdgeInsets.only(bottom: 10))
        .make();
  }
}
