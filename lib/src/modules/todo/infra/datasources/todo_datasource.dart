import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

abstract class ITodoDatasource {
  List<TodoModel> get getTodoList;

  Future<void> addTodo(TodoModel todo);

  Future<void> updateTodo(int index,
      {String? label, String? description, bool? status});

  Future<void> deleteTodo(int index);

  Future<void> close();
}
