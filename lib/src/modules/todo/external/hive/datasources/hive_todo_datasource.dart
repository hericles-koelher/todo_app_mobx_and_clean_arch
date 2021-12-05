import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_list_model.dart';
import 'package:todo_app_mobx/src/modules/todo/external/hive/adapters/hive_todo_list_adapter.dart';
import 'package:todo_app_mobx/src/modules/todo/infra/datasources/todo_datasource.dart';

class HiveTodoDatasource implements ITodoDatasource {
  static const String _datasourceBox = "todo_box";
  static const String _datasourceKey = "todo_list";

  final Box<HiveTodoListAdapter> _box;

  @override
  TodoListModel get getTodoListModel => _box.get(_datasourceKey)!.toModel();

  HiveTodoDatasource._(Box<HiveTodoListAdapter> box) : _box = box;

  static Future<HiveTodoDatasource> createDatasource() async {
    Box<HiveTodoListAdapter> box = await Hive.openBox(_datasourceBox);

    // Creating initial todo list.
    if (box.isEmpty) {
      await box.put(
        _datasourceKey,
        HiveTodoListAdapter.fromTodoListModel(TodoListModel()),
      );
    }

    return HiveTodoDatasource._(box);
  }

  @override
  Future<void> updateTodoListModel(TodoListModel newTodoListModel) async {
    await _box.put(
      _datasourceKey,
      HiveTodoListAdapter.fromTodoListModel(newTodoListModel),
    );
  }

  @override
  Future<void> close() async {
    await _box.close();
  }
}
