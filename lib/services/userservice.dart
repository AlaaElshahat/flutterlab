import 'package:httpdemo/models/user.dart';
import 'package:dio/dio.dart';

import '../models/user.dart';

class UserService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String userService = "users";
  Future<List<User>> getUsers() async {
    List<User> userList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl$userService");
    var userData = response.data;
    userData.forEach((userItem) {
      User user = User.fromJson(userItem);
      userList.add(user);
    });
    return userList;
  }
}
