import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:screenpage_loginpage/controllers/home_controller.dart';
import 'package:screenpage_loginpage/models/post_model.dart';
import 'package:screenpage_loginpage/repositories/home_repository_imp.dart';
import 'package:screenpage_loginpage/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());
  

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: ValueListenableBuilder<List<PostModel>>(valueListenable: _controller.posts, builder: (_, list, __){
        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (_, idx) => ListTile(
            leading: Text(list[idx].id.toString()),
            trailing: Icon(Icons.arrow_forward),
            title: Text(list[idx].title),
          ),
          separatorBuilder: (_, __) => Divider(),
          );
      }),
    );
  }
}
