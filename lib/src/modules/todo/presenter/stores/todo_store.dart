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
  List<TodoModel> _todoList;

  @computed
  List<TodoModel> get todoList => _todoList;

  _TodoStoreBase({
    required ICreateTodo create,
    required IUpdateTodo update,
    required IDeleteTodo delete,
    required IGetTodoList getTodo,
  })  : _create = create,
        _update = update,
        _delete = delete,
        _getTodo = getTodo,
        _todoList = getTodo.todoList;

  @action
  Future<void> createTodo({
    required String label,
    String? description,
  }) async {
    await _create(
      label: label,
      description: description,
    );

    _todoList = _getTodo.todoList;
  }

  @action
  Future<void> updateTodo(
    int index, {
    String? label,
    String? description,
    bool? status,
  }) async {
    await _update(
      index,
      label: label,
      description: description,
      status: status,
    );

    _todoList = _getTodo.todoList;
  }

  @action
  Future<void> deleteTodo(int index) async {
    await _delete(index);

    _todoList = _getTodo.todoList;
  }
}
