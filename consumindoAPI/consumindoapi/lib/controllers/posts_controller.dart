import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/posts_model.dart';

class PostsController{

  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]); //para só recriarr um determinado bloco de código
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoader.value = false;
    } //básico para fazer uma chamada de uma api
  }
}