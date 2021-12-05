import 'package:uuid/uuid.dart';
import '../domain.dart';

abstract class ICreateTodo {
  Future<TodoModel> call({
    required String label,
    String? description,
  });
}

class CreateTodoUseCase implements ICreateTodo {
  static const idGenerator = Uuid();

  final ITodoRepository repository;

  CreateTodoUseCase(this.repository);

  @override
  Future<TodoModel> call({
    required String label,
    String? description,
  }) async =>
      await repository.createTodo(
        label: label,
        description: description,
      );
}
