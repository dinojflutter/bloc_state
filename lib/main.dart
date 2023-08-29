import 'package:block_app1/Screens/home_screen.dart';
import 'package:block_app1/bloc/product_model_bloc.dart';
import 'package:block_app1/cubit/users_cubit.dart';
import 'package:block_app1/debug/bloc_observer.dart';
import 'package:block_app1/repo/Products_repo.dart';
import 'package:block_app1/repo/User_repo.dart';
import 'package:block_app1/repo/todo_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductRepo(),
      ),
      RepositoryProvider(
        create: (context) => UsersRepo(),
      ),
      RepositoryProvider(
        create: (context) => TodoRepo(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductModelBloc(ProductRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(UsersRepo()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Homepage()),
    );
  }
}
