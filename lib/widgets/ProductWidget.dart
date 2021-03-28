import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_store/models/Product.model.dart';
import 'package:mega_store/screens/ProductDetail.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key key,
    this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: VStack(
        [
          VxBox(
            child: Image(
              image: NetworkImage(product.image),
              fit: BoxFit.contain,
            ),
          ).height(150).width(150).make(),
          RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 8.0),
              textAlign: TextAlign.start,
              maxLines: 2,
              text: "${product.title}"
                  .textSpan
                  .black
                  .size(14)
                  .lineHeight(1.5)
                  .make()),
          "₹ ${product.price}".text.bold.xl2.start.make(),
        ],
        alignment: MainAxisAlignment.spaceEvenly,
      ),
    )
        .height(250)
        .margin(EdgeInsets.symmetric(vertical: 10))
        .width(170)
        .px12
        .make()
        .onInkTap(() {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ProductDetail(
            product: product,
          ),
        ),
      );
    });
  }
}
