import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

part 'hive_todo_object.g.dart';

@HiveType(typeId: 0)
class HiveTodoObject extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String label;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool status;

  HiveTodoObject({
    required this.id,
    required this.label,
    this.description,
    required this.status,
  });

  TodoModel toModel() => TodoModel(
        id: id,
        label: label,
        description: description,
        status: status,
      );
}
