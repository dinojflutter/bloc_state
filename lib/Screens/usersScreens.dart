import 'package:block_app1/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User_Screen extends StatefulWidget {
  const User_Screen({super.key});

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  @override
  void initState() {
    context.read<UsersCubit>().onloaduser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello cubit"),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    state.usersModel[index].email.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            );
          } else if (state is UsersErrorState) {
            return Center(child: Text(" Error Message"));
          }
          return SizedBox();
        },
      ),
    );
  }
}
