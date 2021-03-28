import 'package:flutter/material.dart';
import 'package:mega_store/models/Product.model.dart';
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
          ],
        ),
      )
          .width(size.width)
          .margin(
            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          )
          .make(),
    );
  }
}
