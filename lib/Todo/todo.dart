import 'package:block_app1/Todo/todo_model.dart';
import 'package:block_app1/Todo/todo_modelview.dart';
import 'package:block_app1/repo/todo_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_bloc/velocity_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoViewModel todoViewModel;

  @override
  void initState() {
    todoViewModel = TodoViewModel(context.read<TodoRepo>());
    todoViewModel.getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo List "),
      ),
      body: BlocBuilder<VelocityBloc<List<TodoModel>?>,
          VelocityState<List<TodoModel>?>>(
        bloc: todoViewModel.todoModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.builder(
              itemCount: state.data!.toList().length,
              itemBuilder: (context, index) {
                var todoData = state.data!.toList()[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      todoData.title.toString(),
                    ),
                    subtitle: Text(todoData.completed.toString()),
                  ),
                );
              },
            );
          } else if (state is VelocityFailedState) {
            return Center(
              child: Text(state.error),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
