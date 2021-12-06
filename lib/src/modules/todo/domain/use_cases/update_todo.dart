import '../domain.dart';

abstract class IUpdateTodo {
  Future<void> call(
    int todoIndex, {
    String? label,
    String? description,
    bool? status,
  });
}

class UpdateTodoUseCase implements IUpdateTodo {
  final ITodoRepository repository;

  UpdateTodoUseCase(this.repository);

  @override
  Future<void> call(
    int todoIndex, {
    String? label,
    String? description,
    bool? status,
  }) async =>
      await repository.updateTodo(
        todoIndex,
        label: label,
        description: description,
        status: status,
      );
}
