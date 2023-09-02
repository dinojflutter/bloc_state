import 'package:block_app1/Screens/my_checkBox/widgets/my_checkbox_import.dart';
import 'package:block_app1/Screens/productscreen.dart';
import 'package:block_app1/Screens/usersScreens.dart';
import 'package:block_app1/Todo/todo.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomeScreen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreem()));
              },
              child: const Text("Buy Goods"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const User_Screen()));
              },
              child: const Text("User Model"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoScreen()));
              },
              child: const Text("Todo List"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MycheckBox()));
              },
              child: const Text("Check Box"),
            ),
          ),
        ],
      ),
    );
  }
}
