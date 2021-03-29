import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mega_store/models/Product.model.dart';
import 'package:mega_store/widgets/ButtonWidget.dart';
import 'package:mega_store/widgets/DefaultAppbar.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key, this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaulttAppbar("", false),
        backgroundColor: Vx.white,
        body: VxBox(
                child: VStack(
          [
            Image(
              image: NetworkImage(product.image, scale: 1),
              height: size.height * 0.45,
              fit: BoxFit.contain,
            ).centered(),
            SizedBox(
              height: 20,
            ),
            "${product.title}".text.fontWeight(FontWeight.w400).xl.make(),
            SizedBox(
              height: 6,
            ),
            HStack(
              [
                "₹  ${product.price}".text.bold.xl2.start.make(),
                SizedBox(
                  width: 10,
                ),
                "*MRP incl. of all taxes".text.medium.gray400.make(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            HStack([
              VxRating(
                onRatingUpdate: (value) {},
                value: 8,
                count: 5,
                selectionColor: Colors.black,
                isSelectable: false,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              VxBox(
                child: "${product.category}"
                    .text
                    .white
                    .semiBold
                    .uppercase
                    .make()
                    .centered(),
              )
                  .height(33)
                  .color(Vx.black)
                  .width(size.width * .38)
                  .rounded
                  .make(),
            ]),
            SizedBox(
              height: 10,
            ),
            "Description".text.bold.xl2.black.make(),
            SizedBox(
              height: 8,
            ),
            VStack(product.description.map((e) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: HStack(
                  [
                    Icon(FontAwesome.arrow_circle_o_right),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: e.text.semiBold.make(),
                    )
                  ],
                ),
              );
            }).toList())
          ],
        ).scrollVertical())
            .width(size.width)
            .margin(
              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            )
            .make(),
        bottomSheet: VxBox(
                child: HStack(
          [
            Expanded(
              child: ButtonWidget(
                buttonText: "Add to Cart",
                size: size,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: ButtonWidget(
                buttonText: "Buy Now",
                size: size,
                color: Colors.black,
                onPressed: () {},
              ),
            )
          ],
        ).px20())
            .height(60)
            .width(size.width)
            .white
            .make());
  }
}
