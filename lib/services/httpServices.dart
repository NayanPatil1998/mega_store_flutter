import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mega_store/models/Product.model.dart';
import 'package:mega_store/models/category.model.dart';

class HttpService {
  final String baseUrl = "http://192.168.56.66:8080/api";
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

  Future<String> createUser(String email, String name, String password) async {
    Response res =
        await client.post(Uri.parse('${this.baseUrl}/adduser'), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    }, body: {
      "name": name,
      "email": email,
      "password": password,
    });
    return res.body;
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    Response res =
        await client.get(Uri.parse('${this.baseUrl}/products/$category'));
    print(res);
//
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ProductModel> products =
          body.map((dynamic item) => ProductModel.fromJson(item)).toList();
      return products;
    } else {
      throw "Failed to load products list";
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    Response res = await client.get(Uri.parse('${this.baseUrl}/featproducts'));
//
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ProductModel> products =
          body.map((dynamic item) => ProductModel.fromJson(item)).toList();
      return products;
    } else {
      throw "Failed to load products list";
    }
  }

  Future postUserData(String email, String name, String uid) async {
    Response res =
        await client.post(Uri.parse('${this.baseUrl}/adduser'), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer ${uid}"
    }, body: {
      "name": name,
      "email": email,
      "uid": uid,
    });
    return res.statusCode;
  }
}
