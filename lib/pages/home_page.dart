import 'package:flutter/material.dart';
import 'package:list_4bhif/domain/todo.dart';
import 'package:list_4bhif/widgets/add_todo.dart';
import 'package:list_4bhif/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todos = [
    Todo('Duschen'),
  ];

  final _controllers = {
    'top': TextEditingController(),
    'modalSheet': TextEditingController(),
  };

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
  }

  void _addTodo(controller) {
    final input = controller.text;
    final todo = Todo(input);
    setState(() {
      _todos.add(todo);
      controller.clear();
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.toggleDone();
      // _todos.remove(todo);
    });
  }

  void _removeTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.favorite),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddTodo(_addTodo, _controllers['top']!),
            Expanded(
              child: TodoList(_todos, _toggleTodo, _removeTodo),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 400,
              alignment: Alignment.topCenter,
              child: AddTodo(_addTodo, _controllers['modalSheet']!),
            ),
          );
        },
      ),
    );
  }
}
