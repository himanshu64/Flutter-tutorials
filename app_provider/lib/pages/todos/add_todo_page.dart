import 'package:app_provider/models/todo_model.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTextController = TextEditingController();
  bool completeStatus = false;

  @override
  void dispose() {
    todoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Todo"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: todoTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Todo title',
                  ),
                ),
                CheckboxListTile(
                  value: completeStatus,
                  onChanged: (bool? checked) {
                    setState(() {
                      completeStatus = checked!;
                    });
                  },
                  title: const Text('Complete?'),
                ),
                ElevatedButton(
                  onPressed: onAdd,
                  child: const Text("Add"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onAdd() {
    final String todoTitle = todoTextController.text;
    final bool complete = completeStatus;

    if (todoTitle.isNotEmpty) {
      final Todo todo = Todo(title: todoTitle, completed: complete);
      Provider.of<TodoModel>(context, listen: false).addTodo(todo);
    }

    Navigator.pop(context);
  }
}
