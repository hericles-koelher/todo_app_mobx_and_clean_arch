import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/domain.dart';
import 'package:todo_app_mobx/src/modules/todo/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var datasource = Provider.of<ITodoDatasource>(context);

    var repository = TodoRepository(datasource);

    ICreateTodo create = CreateTodoUseCase(repository);
    IUpdateTodo update = UpdateTodoUseCase(repository);
    IDeleteTodo delete = DeleteTodoUseCase(repository);
    IGetTodoList getTodoList = GetTodoListUseCase(repository);

    var store = TodoStore(
      create: create,
      update: update,
      delete: delete,
      getTodo: getTodoList,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO - Mobx"),
      ),
      body: Observer(
        builder: (context) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: store.todoList
              .map(
                (e) => TodoTile(
                  todo: e,
                  onCheckboxChanged: (bool? newValue) {},
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                // Create todo form
                children: [],
              ),
            ),
          );
        },
      ),
    );
  }
}
