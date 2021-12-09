import 'package:flutter/material.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/models/users.dart';
import 'package:flutter_news/services/api_manager.dart';

class UpdatedUsersPage extends StatefulWidget {
  const UpdatedUsersPage({Key? key}) : super(key: key);

  @override
  _UpdatedUsersPageState createState() => _UpdatedUsersPageState();
}

class _UpdatedUsersPageState extends State<UpdatedUsersPage> {
  List<User> _users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    APIManager.getUsers().then((users) {
      _users = users;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            // itemCount: snapshot.data.articles.length,
            itemCount: _users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = _users[index];
              print(user);
              print(user.name!);
              return GridTile(
                child: Text(user.name!),
                //Image.network('src')
              );
            }));
  }
}
