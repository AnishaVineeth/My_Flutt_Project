import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/models/users.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  Users _user = Users();
  bool isLoading = true;

  void getData() async {
    var url = Uri.parse("https://fluttmac.github.io/api/user.json");
    final response = await http.get(url);
    var json = jsonDecode(response.body);
    setState(() {
      _user = Users.fromJson(json);
      isLoading = false;
    });
    print('$response heree..');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Flutter Users",
            style: TextStyle(color: Colors.pink),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _user.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.pinkAccent[100]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _user.data![index].name!,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(_user.data![index].email!),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(_user.data![index].profession!),
                      ],
                    ),
                  );
                }));
  }
}
