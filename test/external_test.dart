import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/external/external.dart';

void main() async {
  Hive.init("/home/hericles/Flutter Projects/todo_app_mobx");

  Hive.registerAdapter(HiveTodoAdapterAdapter());
  Hive.registerAdapter(HiveTodoListAdapterAdapter());

  var todo = const TodoModel(id: "123", label: "Beber, cair e levantar");

  test("Created empty todo list", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    expect(datasource.getTodoListModel, TodoListModel());

    await datasource.close();
  });

  test("Updated todo list", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    var todoList = datasource.getTodoListModel;

    todoList.todos.add(todo);

    await datasource.updateTodoListModel(todoList);

    expect(datasource.getTodoListModel, TodoListModel(initialList: [todo]));

    await datasource.close();
  });

  test("Deleted from todo list", () async {
    var datasource = await HiveTodoDatasource.createDatasource();

    var todoList = datasource.getTodoListModel;

    todoList.todos.remove(todo);

    await datasource.updateTodoListModel(todoList);

    expect(datasource.getTodoListModel, TodoListModel());

    await datasource.close();
  });
}
