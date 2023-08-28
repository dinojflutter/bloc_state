import 'package:http/http.dart' as http;

import 'package:block_app1/Models/User_Model.dart';

class UsersRepo {
  Future<List<UsersModel>> getUser() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw Exception("Failed to load Users");
    }
  }
}
