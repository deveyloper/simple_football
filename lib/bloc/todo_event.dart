
import 'package:simple_football/models/Todo.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  Todo todo;
  AddTodoEvent({this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  int index;
  DeleteTodoEvent({this.index});
}
