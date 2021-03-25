import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mega_store/models/category.model.dart';

class HttpService {
  final String baseUrl = "http://192.168.43.218:8080/api";
  Client client = Client();

  Future<List<CategoryModel>> getCategories() async {
    Response res = await client.get(Uri.parse('${this.baseUrl}/categories'));
    print(res);
//
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CategoryModel> cases =
          body.map((dynamic item) => CategoryModel.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }
}
