import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/todos.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final AppTodo todo = ModalRoute.of(context)!.settings.arguments as AppTodo;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: AppColors.logoColor),
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  todo.title.toString(),
                  style: const TextStyle(
                      color: AppColors.logoColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${todo.id}',
                  style: const TextStyle(
                      color: AppColors.logoColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'STATUS : ${todo.isCompleted}',
                  style: const TextStyle(
                      color: AppColors.logoColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.logoColor)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back To List",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
