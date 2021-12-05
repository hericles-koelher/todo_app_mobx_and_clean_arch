import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

import '../domain.dart';

abstract class ITodoRepository {
  TodoListModel get getTodoListModel;

  Future<TodoModel> createTodo({
    required String label,
    String? description,
  });

  Future<TodoModel> updateTodo(
    int todoIndex, {
    String? label,
    String? description,
    bool? status,
  });

  Future<void> deleteTodo(int index);
}
