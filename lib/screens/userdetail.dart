import 'package:flutter/material.dart';
import 'package:httpdemo/models/user.dart';
import 'package:httpdemo/screens/utlitis.dart';

class UserDetail extends StatefulWidget {
  User user;
  UserDetail(this.user);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(" name : ${widget.user.name}"),
          ),
        ),
        Divider(),
        InkWell(
            onTap: () {
              launchURL("mailto:${widget.user.email}");
            },
            child: Text("Email: ${widget.user.email}")),
        SizedBox(
          height: 10,
        ),
        Divider(),
        InkWell(
            onTap: () {
              launchURL("tel:${widget.user.phone}");
            },
            child: Text("phone: ${widget.user.phone}")),
        SizedBox(
          height: 10,
        ),
        Divider(),
        InkWell(
            onTap: () {
              launchURL("https://${widget.user.website}");
            },
            child: Text("web: ${widget.user.website}")),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    ));
  }
}
