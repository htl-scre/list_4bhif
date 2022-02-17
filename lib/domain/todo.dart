import './domain.dart';

class Todo {
  final int id;
  final String description;
  final Domain domain;
  bool done;

  static int lastId = 0;

  Todo(this.description, {this.done = false, this.domain = Domain.self})
      : id = lastId++;

  void toggleDone() {
    done = !done;
  }
}
