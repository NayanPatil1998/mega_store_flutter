import 'package:flutter/material.dart';
import 'package:mega_store/models/Product.model.dart';
import 'package:mega_store/services/httpServices.dart';
import 'package:velocity_x/velocity_x.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({
    Key key,
  }) : super(key: key);
  Future loadList() async {
    final HttpService api = HttpService();
    List<ProductModel> futureList = await api.getFeaturedProducts();
    return futureList;
  }

  List<Widget> buildWidgets(dynamic data) {
    List<Widget> list = [];
    data.forEach(
      (ProductModel element) => {
        list.add(VxBox(
          child: VStack(
            [
              VxBox(
                child: Image(
                  image: NetworkImage(element.image),
                  fit: BoxFit.contain,
                ),
              ).height(150).width(150).make(),
              RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 8.0),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  text: "${element.title}"
                      .textSpan
                      .black
                      .size(14)
                      .lineHeight(1.5)
                      .make()),
              "₹ ${element.price}".text.bold.xl2.start.make(),
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          ),
        )
            .height(250)
            .margin(EdgeInsets.symmetric(vertical: 10))
            .width(170)
            .px12
            .make())
      },
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: loadList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState.index == 2) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return snapshot.error
                .toString()
                .text
                .black
                .medium
                .make()
                .centered();
          }
          if (snapshot.hasData) {
            return Container(
              child: Wrap(
                spacing: 10,
                children: buildWidgets(snapshot.data),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
