import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_list_model.dart';
import '../../external.dart';

part 'hive_todo_list_adapter.g.dart';

@HiveType(typeId: 1)
class HiveTodoListAdapter extends HiveObject {
  @HiveField(0)
  final List<HiveTodoAdapter> adaptersList;

  TodoListModel toModel() => TodoListModel(
        initialList: adaptersList.map((e) => e.toModel()).toList(),
      );

  HiveTodoListAdapter(this.adaptersList);

  factory HiveTodoListAdapter.fromTodoListModel(TodoListModel todoListModel) {
    return HiveTodoListAdapter(
      todoListModel.todos.map((e) => HiveTodoAdapter.fromTodoModel(e)).toList(),
    );
  }
}
