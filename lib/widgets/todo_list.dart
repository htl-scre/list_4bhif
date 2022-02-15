import 'package:flutter/material.dart';
import 'package:list_4bhif/domain/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final void Function(Todo todo) removeTodo;

  const TodoList(this.todos, this.removeTodo, {Key? key}) : super(key: key);

  TextStyle? buildStyle(Todo todo) {
    if (todo.done) {
      return TextStyle(
        decoration: TextDecoration.lineThrough,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              todos[index].description,
              style: buildStyle(todos[index]),
            ),
            trailing: CircleAvatar(
              child: IconButton(
                onPressed: () => removeTodo(todos[index]),
                icon: todos[index].done ? Text('X') : Icon(Icons.check),
              ),
            ),
          ),
          elevation: 2,
        );
      },
      itemCount: todos.length,
    );
  }
}
