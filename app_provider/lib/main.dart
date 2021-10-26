import 'package:app_provider/pages/authenticate_page.dart';
import 'package:app_provider/pages/todos/add_todo_page.dart';
import 'package:app_provider/pages/todos/all_todos_page.dart';
import 'package:app_provider/pages/todos/complete_todos_page.dart';
import 'package:app_provider/pages/todos/incomplete_todos_page.dart';
import 'package:app_provider/providers/auth_viewmodel.dart';
import 'package:app_provider/providers/todos_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoModel>(
          create: (context) => TodoModel(),
        ),
        Provider<AuthViewModel>(
          create: (_) => AuthViewModel(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context) => context.read<AuthViewModel>().authState,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        home: Authenticate(),
      ),
    );
  }
}
