import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar defaulttAppbar(String title, bool isForHome) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: title.text.uppercase.black.make(),
    actions: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: Vx.black,
          size: 24,
        ),
        onPressed: () {},
      )
    ],
  );
}
