import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:screenpage_loginpage/repositories/home_repository.dart';

import '../models/post_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
