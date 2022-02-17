import 'package:flutter/material.dart';

import '../domain/domain.dart';

class AddTodo extends StatefulWidget {
  final void Function(TextEditingController controller) addTodo;
  final TextEditingController controller;

  AddTodo(this.addTodo, this.controller, {Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var selectedDomain = Domain.self;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      //TODO maybe convert to Form
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'New todo',
            ),
            controller: widget.controller,
            onSubmitted: (_) => widget.addTodo(widget.controller),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<Domain>(
                value: selectedDomain,
                items: Domain.values
                    .map(
                      (domain) => DropdownMenuItem(
                        child: Text('$domain'.split('\.')[1]),
                        value: domain,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedDomain = value!);
                },
              ),
              IconButton(
                onPressed: () => widget.addTodo(widget.controller),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
