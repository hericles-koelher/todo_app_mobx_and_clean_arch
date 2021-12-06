import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/infra/datasources/todo_datasource.dart';
import 'package:uuid/uuid.dart';

class TodoRepository implements ITodoRepository {
  static const idGenerator = Uuid();

  final ITodoDatasource _datasource;

  @override
  List<TodoModel> get getTodoList => _datasource.getTodoList;

  TodoRepository(this._datasource);

  @override
  Future<void> createTodo({required String label, String? description}) async {
    var todo = TodoModel(
      id: idGenerator.v1(),
      label: label,
      description: description,
    );

    await _datasource.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(int index) async =>
      await _datasource.deleteTodo(index);

  @override
  Future<void> updateTodo(
    int index, {
    String? label,
    String? description,
    bool? status,
  }) async =>
      await _datasource.updateTodo(
        index,
        label: label,
        description: description,
        status: status,
      );
}
