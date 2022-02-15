import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  final void Function() addTodo;
  final TextEditingController controller;

  const AddTodo(this.addTodo, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => addTodo(),
            ),
          ),
          IconButton(
            onPressed: addTodo,
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
