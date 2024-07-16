import 'package:flutter/material.dart';
import 'package:todo_list_mvvm_rest_api/view/todo_create.dart';
import 'package:todo_list_mvvm_rest_api/view/todo_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mvvm_rest_api/viewModel/todo_viewmodel.dart';
import 'package:todo_list_mvvm_rest_api/helper/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoViewmodel>(create:(_)=>TodoViewmodel(NavigationService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: TodoList(),
      ),
    );
  }
}
