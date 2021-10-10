import 'package:app_provider/models/todo_model.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
          value: todo.completed,
          onChanged: (bool? checked) {
            Provider.of<TodoModel>(context, listen: false).toggleTodo(todo);
          }),
      trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            Provider.of<TodoModel>(context, listen: false).deleteTodo(todo);
          }),
    );
  }
}
