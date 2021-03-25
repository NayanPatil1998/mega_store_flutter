class CategoryModel {
  String date;
  String sId;
  String category;
  String imageUrl;
  int iV;

  CategoryModel({this.date, this.sId, this.category, this.imageUrl, this.iV});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sId = json['_id'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['__v'] = this.iV;
    return data;
  }
}
