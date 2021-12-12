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

    final textTheme = Theme.of(context).textTheme;

    const double titleVerticalPadding = 15;
    const double titleHorizontalPadding = 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO - Mobx"),
      ),
      body: Observer(builder: (_) {
        var todoList = store.todoList.where((todo) => !todo.status).toList();
        var doneList = store.todoList.where((todo) => todo.status).toList();

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: titleVerticalPadding,
                  horizontal: titleHorizontalPadding,
                ),
                child: Text(
                  "To Do",
                  style: textTheme.headline6,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  int indexInOriginalList =
                      store.todoList.indexOf(todoList[index]);

                  return TodoTile(
                    todo: todoList[index],
                    onCheckboxChanged: (bool? newValue) {
                      store.updateTodo(
                        indexInOriginalList,
                        status: newValue,
                      );
                    },
                    onDismissed: () {
                      store.deleteTodo(indexInOriginalList);
                    },
                  );
                },
                childCount: todoList.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: titleVerticalPadding,
                  horizontal: titleHorizontalPadding,
                ),
                child: Text(
                  "Done",
                  style: textTheme.headline6,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  int indexInOriginalList =
                      store.todoList.indexOf(doneList[index]);

                  return TodoTile(
                    todo: doneList[index],
                    onCheckboxChanged: (bool? newValue) {
                      store.updateTodo(
                        indexInOriginalList,
                        status: newValue,
                      );
                    },
                    onDismissed: () {
                      store.deleteTodo(indexInOriginalList);
                    },
                  );
                },
                childCount: doneList.length,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          const double borderRadius = 25;

          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            context: context,
            builder: (context) => TodoForm(
              done: ({required String label, String? description}) async {
                await store.createTodo(label: label, description: description);
              },
            ),
          );
        },
      ),
    );
  }
}
