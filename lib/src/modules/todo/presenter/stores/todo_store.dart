import 'package:mobx/mobx.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  final ICreateTodo _create;
  final IUpdateTodo _update;
  final IDeleteTodo _delete;
  final IGetTodoList _getTodo;

  @observable
  List<TodoModel> todoList;

  _TodoStoreBase({
    required ICreateTodo create,
    required IUpdateTodo update,
    required IDeleteTodo delete,
    required IGetTodoList getTodo,
  })  : _create = create,
        _update = update,
        _delete = delete,
        _getTodo = getTodo,
        todoList = getTodo.todoListModel.todos;

  @action
  Future<TodoModel> createTodo({
    required String label,
    String? description,
  }) async {
    return await _create(
      label: label,
      description: description,
    );
  }

  @action
  Future<TodoModel> toggleStatus(int index) async {
    var todo = _getTodo.todoListModel.todos[index];

    return await _update(index, status: !todo.status);
  }

  @action
  Future<TodoModel> editTodo(
    int index, {
    String? label,
    String? description,
  }) async {
    return await _update(
      index,
      label: label,
      description: description,
    );
  }

  @action
  Future<void> deleteTodo(int index) async {
    return await _delete(index);
  }
}
