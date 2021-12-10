import 'package:flutter/material.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/models/updated_users.dart';
import 'package:flutter_news/models/users.dart';
import 'package:flutter_news/services/api_manager.dart';

class UpdatedUsersPage extends StatefulWidget {
  const UpdatedUsersPage({Key? key}) : super(key: key);

  @override
  _UpdatedUsersPageState createState() => _UpdatedUsersPageState();
}

class _UpdatedUsersPageState extends State<UpdatedUsersPage> {
  late Future<UpdatedUsers> _users;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    APIManager.getUsers().then((users) {
      _users = users as Future<UpdatedUsers>;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
