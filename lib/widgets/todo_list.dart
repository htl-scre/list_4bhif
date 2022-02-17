import 'package:flutter/material.dart';
import 'package:list_4bhif/domain/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final void Function(Todo todo) toggleTodo;
  final void Function(Todo todo) removeTodo;

  const TodoList(this.todos, this.toggleTodo, this.removeTodo, {Key? key})
      : super(key: key);

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
    return todos.isEmpty
        ? Image.network(
            'https://cdn.dribbble.com/users/310943/screenshots/2792692/empty-state-illustrations.gif')
        : ListView.builder(
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(todos[index].id),
                background: Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.red,
                  child: Icon(Icons.delete),
                  alignment: Alignment.centerRight,
                ),
                onDismissed: (_) {
                  removeTodo(todos[index]);
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      todos[index].description,
                      style: buildStyle(todos[index]),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      child: IconButton(
                        onPressed: () => toggleTodo(todos[index]),
                        icon: todos[index].done ? Text('X') : Icon(Icons.check),
                      ),
                    ),
                  ),
                  elevation: 2,
                ),
              );
            },
            itemCount: todos.length,
          );
  }
}
