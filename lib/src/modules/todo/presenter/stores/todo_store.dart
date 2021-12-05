import 'package:mobx/mobx.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  final ICreateTodo create;
  final IUpdateTodo update;
  final IDeleteTodo delete;
  final IGetTodoList getTodo;

  @observable
  TodoListModel todoList;

  _TodoStoreBase({
    required this.create,
    required this.update,
    required this.delete,
    required this.getTodo,
  }) : todoList = getTodo.todoListModel;

  @action
  Future<TodoModel> createTodo({
    required String label,
    String? description,
  }) async {
    return await create(
      label: label,
      description: description,
    );
  }

  @action
  Future<TodoModel> toggleStatus(int index) async {
    var todo = getTodo.todoListModel.todos[index];

    return await update(index, status: !todo.status);
  }

  @action
  Future<TodoModel> editTodo(
    int index, {
    String? label,
    String? description,
  }) async {
    return await update(
      index,
      label: label,
      description: description,
    );
  }

  @action
  Future<void> deleteTodo(int index) async {
    return await delete(index);
  }
}
