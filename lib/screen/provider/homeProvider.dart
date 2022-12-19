import 'dart:convert';
import 'package:apicall/screen/model/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  String apilink = "https://jsonplaceholder.typicode.com/posts";

  Future<List> apicalling() async {
    var jsonString = await http.get(
      Uri.parse(apilink),
    );
    var json = jsonDecode(jsonString.body);
    return json.map((e) => PostModel.fromJson(e)).toList();
  }
}
