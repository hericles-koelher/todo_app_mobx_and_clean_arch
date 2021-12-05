import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

abstract class ITodoDatasource {
  TodoListModel get getTodoListModel;

  Future<void> updateTodoListModel(TodoListModel todoListModel);

  Future<void> close();
}
