import 'package:app_provider/models/todo_model.dart';
import 'package:app_provider/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => TodoListItem(
        todo: todos[index],
      ),
      itemCount: todos.length,
    );
  }
}
