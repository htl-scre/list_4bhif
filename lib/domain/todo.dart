class Todo {
  final String description;
  bool done;

  Todo(this.description, {this.done = false});

  void toggleDone() {
    done = !done;
  }
}
