import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/external/external.dart';
import 'package:todo_app_mobx/src/modules/todo/todo.dart';

void main() async {
  Hive.init("/home/hericles/Flutter Projects/todo_app_mobx");

  Hive.registerAdapter(HiveTodoAdapterAdapter());
  Hive.registerAdapter(HiveTodoListAdapterAdapter());

  test("Created and updated repository with one todo", () async {
    var repo = TodoRepository(await HiveTodoDatasource.createDatasource());

    var todo = await repo.createTodo(label: "Beber, cair e levantar");

    expect(repo.getTodoListModel, TodoListModel(initialList: [todo]));
  });

  test("Deleted from repository", () async {
    var repo = TodoRepository(await HiveTodoDatasource.createDatasource());

    repo.deleteTodo(0);

    expect(repo.getTodoListModel, TodoListModel());
  });
}
