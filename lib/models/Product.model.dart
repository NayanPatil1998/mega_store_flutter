class ProductModel {
  List<String> description;
  String date;
  String sId;
  String title;
  int price;
  String category;
  String image;
  bool feat;
  int iV;

  ProductModel(
      {this.description,
      this.date,
      this.sId,
      this.title,
      this.price,
      this.category,
      this.image,
      this.feat,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
    date = json['date'];
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    feat = json['feat'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['category'] = this.category;
    data['image'] = this.image;
    data['feat'] = this.feat;
    data['__v'] = this.iV;
    return data;
  }
}
