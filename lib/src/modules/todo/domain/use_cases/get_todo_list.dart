import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';

abstract class IGetTodoList {
  TodoListModel get todoListModel;
}

class GetTodoListUseCase implements IGetTodoList {
  final ITodoRepository repository;

  GetTodoListUseCase(this.repository);

  @override
  TodoListModel get todoListModel => repository.getTodoListModel;
}
