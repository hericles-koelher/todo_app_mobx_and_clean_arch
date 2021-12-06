import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

abstract class IGetTodoList {
  List<TodoModel> get todoList;
}

class GetTodoListUseCase implements IGetTodoList {
  final ITodoRepository repository;

  GetTodoListUseCase(this.repository);

  @override
  List<TodoModel> get todoList => repository.getTodoList;
}
