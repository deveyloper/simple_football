import 'dart:async';

import 'package:simple_football/bloc/todo_event.dart';
import 'package:simple_football/models/Todo.dart';

class TodoBloc {
  List<Todo> _todoList = [];

  final _todoEventController = StreamController<TodoEvent>();
  Sink<TodoEvent> get todoEventSink => _todoEventController.sink;

  final _todoStateContolller = StreamController<List<Todo>>();
  StreamSink<List<Todo>> get _inTodoList => _todoStateContolller.sink;
  Stream<List<Todo>> get todos => _todoStateContolller.stream;

  TodoBloc() {
    _todoEventController.stream.listen(onData);
  }

  void onData(TodoEvent event) {
    if (event is AddTodoEvent) {
      _todoList.add(event.todo);
    } else if (event is DeleteTodoEvent) {
      _todoList.removeAt(event.index);
    }

    _inTodoList.add(_todoList);
  }

  void dispatch(TodoEvent event) {
    todoEventSink.add(event);
  }

  void dispose() {
    _todoEventController.close();
    _todoStateContolller.close();
  }
}
