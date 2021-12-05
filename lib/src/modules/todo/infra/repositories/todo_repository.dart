import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/infra/datasources/todo_datasource.dart';
import 'package:uuid/uuid.dart';

class TodoRepository implements ITodoRepository {
  static const idGenerator = Uuid();

  final ITodoDatasource _datasource;

  @override
  TodoListModel get getTodoListModel => _datasource.getTodoListModel;

  TodoRepository(this._datasource);

  @override
  Future<TodoModel> createTodo(
      {required String label, String? description}) async {
    var todo = TodoModel(
      id: idGenerator.v1(),
      label: label,
      description: description,
    );

    var todoListModel = getTodoListModel;

    todoListModel.todos.add(todo);

    await _datasource.updateTodoListModel(todoListModel);

    return todo;
  }

  @override
  Future<void> deleteTodo(int index) async {
    var todoListModel = getTodoListModel;

    todoListModel.todos.removeAt(index);

    await _datasource.updateTodoListModel(todoListModel);
  }

  @override
  Future<TodoModel> updateTodo(
    int todoIndex, {
    String? label,
    String? description,
    bool? status,
  }) async {
    var todoListModel = getTodoListModel;

    var updatedTodo = todoListModel.todos[todoIndex].copyWith(
      label: label,
      description: description,
      status: status,
    );

    todoListModel.todos.removeAt(todoIndex);

    todoListModel.todos.insert(todoIndex, updatedTodo);

    await _datasource.updateTodoListModel(todoListModel);

    return updatedTodo;
  }
}
