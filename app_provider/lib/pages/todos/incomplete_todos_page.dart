import 'package:app_provider/models/todo_model.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:app_provider/widgets/todo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InCompleteTodos extends StatelessWidget {
  const InCompleteTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Todo> inCompleteTodos =
        Provider.of<TodoModel>(context).inCompleteTodos;

    return Container(
        child: TodoListView(
      todos: inCompleteTodos,
    ));
  }
}
