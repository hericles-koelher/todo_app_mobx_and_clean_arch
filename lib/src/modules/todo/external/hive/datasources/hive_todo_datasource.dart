import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';
import 'package:todo_app_mobx/src/modules/todo/infra/datasources/todo_datasource.dart';
import 'package:todo_app_mobx/src/modules/todo/todo.dart';

class HiveTodoDatasource implements ITodoDatasource {
  static const String _datasourceBox = "todo_box";

  final Box<HiveTodoObject> _box;

  @override
  List<TodoModel> get getTodoList =>
      _box.values.map((hiveTodo) => hiveTodo.toModel()).toList();

  HiveTodoDatasource._(Box<HiveTodoObject> box) : _box = box;

  static Future<HiveTodoDatasource> createDatasource() async =>
      HiveTodoDatasource._(
        await Hive.openBox(_datasourceBox),
      );

  @override
  Future<void> close() async {
    await _box.close();
  }

  @override
  Future<void> addTodo(TodoModel todo) async => await _box.add(
        HiveTodoObject(
          id: todo.id,
          label: todo.label,
          description: todo.description,
          status: todo.status,
        ),
      );

  @override
  Future<void> deleteTodo(int index) async => await _box.deleteAt(index);

  @override
  Future<void> updateTodo(int index,
      {String? label, String? description, bool? status}) async {
    var newTodo = _box.values.elementAt(index).toModel().copyWith(
          label: label,
          description: description,
          status: status,
        );

    await _box.putAt(
      index,
      HiveTodoObject(
        id: newTodo.id,
        label: newTodo.label,
        description: newTodo.description,
        status: newTodo.status,
      ),
    );
  }
}
