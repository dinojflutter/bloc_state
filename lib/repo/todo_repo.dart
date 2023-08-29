import 'package:block_app1/Todo/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepo {
  Future<TodoModel> getTodos() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/todos"));
    if (response.statusCode == 200) {
      return todoModelFromJson(response.body);
    } else {
      throw Exception("Failed to Load");
    }
  }
}
