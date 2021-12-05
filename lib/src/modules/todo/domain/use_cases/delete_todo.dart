import '../domain.dart';

abstract class IDeleteTodo {
  Future<void> call(int index);
}

class DeleteTodoUseCase implements IDeleteTodo {
  final ITodoRepository repository;

  DeleteTodoUseCase(this.repository);

  @override
  Future<void> call(int index) async => await repository.deleteTodo(index);
}
