import 'package:flutter/material.dart';
import 'package:mega_store/widgets/CategoryBar.dart';
import 'package:mega_store/widgets/FeaturedProducts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeCategoryRow(),
              VxBox(
                      child: Image(
                image: AssetImage("assets/Images/HomeAd.png"),
              ))
                  .margin(
                    EdgeInsets.symmetric(vertical: 30),
                  )
                  .make()
                  .centered(),
              "Featured Products".text.black.xl2.bold.make(),
              FeaturedProducts()
            ],
          ),
        ));
  }
}
