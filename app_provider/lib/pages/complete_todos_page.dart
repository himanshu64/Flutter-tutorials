import 'package:app_provider/models/todo_model.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:app_provider/widgets/todo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteTodos extends StatelessWidget {
  const CompleteTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Todo> completeTodos =
        Provider.of<TodoModel>(context).completeTodos;

    return Container(
        child: TodoListView(
      todos: completeTodos,
    ));
  }
}
