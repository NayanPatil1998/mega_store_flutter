import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mega_store/models/category.model.dart';
import 'package:mega_store/services/httpServices.dart';
import 'package:mega_store/widgets/CategoryBar.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Vx.black,
        ),
        elevation: 0,
        centerTitle: true,
        title: "Mega Store".text.uppercase.black.make(),
        actions: [
          IconButton(
            icon: Icon(
              FontAwesome.bell_o,
              color: Vx.black,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: VxBox(
        child: VStack(
          [
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
            "Featured Products".text.black.xl2.bold.make()
          ],
        ),
      )
          .width(size.width)
          .margin(EdgeInsets.symmetric(vertical: 15, horizontal: 15))
          .make(),
    );
  }
}
