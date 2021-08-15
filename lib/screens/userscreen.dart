import 'package:flutter/material.dart';
import 'package:httpdemo/models/user.dart';
import 'package:httpdemo/screens/userdetail.dart';
import 'package:httpdemo/screens/utlitis.dart';
import 'package:httpdemo/services/userservice.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool loading = true;
  List<User> userList = [];
  getUserList() async {
    userList = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserInfo"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          pushPage(context, UserDetail(userList[index]));
                        },
                        child: Container(
                            height: 50,
                            child: Card(
                                child: Center(
                                    child:
                                        (Text("${userList[index].name}")))))),
                  ),
                );
              },
            ),
    );
  }
}
