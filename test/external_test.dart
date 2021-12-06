import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/external/external.dart';

void main() async {
  Hive.init("/home/hericles/Flutter Projects/todo_app_mobx/test");

  await Hive.deleteBoxFromDisk("todo_box");

  Hive.registerAdapter(HiveTodoObjectAdapter(), override: true);

  var todo = const TodoModel(id: "123", label: "Beber, cair e levantar");

  test("Created empty todo list", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    expect(datasource.getTodoList, <TodoModel>[]);

    await datasource.close();
  });

  test("Added todo", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    await datasource.addTodo(todo);

    expect(datasource.getTodoList, [todo]);

    await datasource.close();
  });

  test("Updated todo", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    await datasource.updateTodo(0, label: "Só beber");

    expect(datasource.getTodoList, [todo.copyWith(label: "Só beber")]);

    await datasource.close();
  });

  test("Deleted from todo list", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    await datasource.deleteTodo(0);

    expect(datasource.getTodoList, <TodoModel>[]);

    await datasource.close();
  });
}
