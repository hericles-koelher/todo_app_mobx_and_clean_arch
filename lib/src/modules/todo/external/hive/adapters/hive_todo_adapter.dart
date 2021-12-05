import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

part 'hive_todo_adapter.g.dart';

@HiveType(typeId: 0)
class HiveTodoAdapter extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String label;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool status;

  HiveTodoAdapter({
    required this.id,
    required this.label,
    required this.status,
    this.description,
  });

  factory HiveTodoAdapter.fromTodoModel(TodoModel todoModel) {
    return HiveTodoAdapter(
      id: todoModel.id,
      label: todoModel.label,
      status: todoModel.status,
      description: todoModel.description,
    );
  }

  TodoModel toModel() => TodoModel(
        id: id,
        label: label,
        description: description,
        status: status,
      );
}
