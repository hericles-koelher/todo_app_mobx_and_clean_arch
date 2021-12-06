import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

import '../domain.dart';

abstract class ITodoRepository {
  List<TodoModel> get getTodoList;

  Future<void> createTodo({
    required String label,
    String? description,
  });

  Future<void> updateTodo(
    int todoIndex, {
    String? label,
    String? description,
    bool? status,
  });

  Future<void> deleteTodo(int index);
}
