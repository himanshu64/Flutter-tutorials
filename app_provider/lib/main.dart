import 'package:app_provider/pages/add_todo_page.dart';
import 'package:app_provider/pages/all_todos_page.dart';
import 'package:app_provider/pages/complete_todos_page.dart';
import 'package:app_provider/pages/incomplete_todos_page.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoModel>(
      create: (context) => TodoModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(
          title: 'Todo App',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTodoPage()));
                },
                icon: const Icon(Icons.add),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Compelte',
                ),
                Tab(
                  text: 'In Complete',
                ),
              ],
            ),
            title: Text(widget.title),
          ),
          body: const TabBarView(
            children: [
              AllTodos(),
              CompleteTodos(),
              InCompleteTodos(),
            ],
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
