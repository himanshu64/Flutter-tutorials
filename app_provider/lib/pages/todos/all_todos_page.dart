import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:app_provider/widgets/todo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTodos extends StatelessWidget {
  const AllTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTodos = Provider.of<TodoModel>(context).allTodos;
    return Container(
      child: TodoListView(
        todos: allTodos,
      ),
    );
  }
}
