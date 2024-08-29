import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AppTodo> todos = [];
  final TextEditingController titleController = TextEditingController();

  void addTodo() {
    if (titleController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Todo Can't Be Empty!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      setState(() {
        AppTodo newTodo = AppTodo(
          title: titleController.text,
          isCompleted: false,
        );
        todos.add(newTodo);
        Fluttertoast.showToast(
          msg: "Todo Is Added Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    }
    titleController.clear();
  }

  void handleDelete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void handleCompleted(int index) {
    setState(() {
      todos[index].isCompleted =
          !todos[index].isCompleted; // Toggle completion status
      Fluttertoast.showToast(
        msg: todos[index].isCompleted
            ? "Todo Is Completed Successfully!"
            : "Todo Is Marked as Incomplete!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  String time = DateFormat('yMMMd').add_jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todo List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppColors.logoColor,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: "Enter Todo",
                        labelStyle: const TextStyle(color: AppColors.logoColor),
                        hintText: 'Todo',
                        hintStyle: const TextStyle(color: AppColors.logoColor),
                        focusColor: AppColors.logoColor,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.logoColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.logoColor,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: AppColors.logoColor),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.logoColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: addTodo,
                        child: const Text(
                          "Add Todo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              todos.isEmpty
                  ? Container(
                      margin: const EdgeInsets.all(20),
                      height: 100,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.logoColor),
                      ),
                      child: const Text("No List Found"),
                    )
                  : Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          AppTodo todo = todos[index];
                          todo.id = index;
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tileColor: Colors.black,
                            title: Text(
                              todo.title!,
                              style: TextStyle(
                                color: Colors.white,
                                decoration: todo.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              time,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: AppColors.logoColor,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            trailing: SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      handleCompleted(index);
                                    },
                                    icon: Icon(
                                      todo.isCompleted
                                          ? Icons.check_box
                                          : Icons.check,
                                      color: AppColors.logoColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      handleDelete(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/details",
                                        arguments: todo,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: todos.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
