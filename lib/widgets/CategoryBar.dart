import 'package:flutter/material.dart';
import 'package:mega_store/models/category.model.dart';
import 'package:mega_store/services/httpServices.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({
    Key key,
  }) : super(key: key);

  Future loadList() async {
    final HttpService api = HttpService();
    List<CategoryModel> futureList = await api.getCategories();
    return futureList;
  }

  List<Widget> buildWidgets(dynamic data) {
    List<Widget> list = [];
    data.forEach((element) => {
          list.add(VxBox(
            child: VStack(
              [
                Image.network(
                  element.imageUrl,
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                "${element.category}".text.black.medium.bold.make().centered()
              ],
              alignment: MainAxisAlignment.spaceBetween,
            ),
          ).height(120).width(120).margin(EdgeInsets.only(right: 15)).make())
        });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VxBox(
        child: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            print(snapshot.connectionState.index);

            if (snapshot.connectionState.index == 2) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: buildWidgets(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return snapshot.error
                  .toString()
                  .text
                  .black
                  .medium
                  .make()
                  .centered();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ).height(100).make(),
    );
  }
}
