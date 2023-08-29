import 'package:block_app1/Todo/todo_model.dart';
import 'package:block_app1/repo/todo_repo.dart';
import 'package:velocity_bloc/velocity_bloc.dart';

class TodoViewModel {
  final TodoRepo todoRepo;

  TodoViewModel(this.todoRepo);

  final VelocityBloc<TodoModel?> todoModelBloc = VelocityBloc<TodoModel?>(null);

  getTodo() async {
    try {
      var data = await todoRepo.getTodos();
      todoModelBloc.onUpdateData(data);
    } catch (e) {
      todoModelBloc.onFailedResponse(error: e.toString());
    }
  }
}
