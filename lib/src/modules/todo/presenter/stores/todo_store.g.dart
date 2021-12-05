// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStoreBase, Store {
  final _$todoListAtom = Atom(name: '_TodoStoreBase.todoList');

  @override
  TodoListModel get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(TodoListModel value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$createTodoAsyncAction = AsyncAction('_TodoStoreBase.createTodo');

  @override
  Future<TodoModel> createTodo({required String label, String? description}) {
    return _$createTodoAsyncAction
        .run(() => super.createTodo(label: label, description: description));
  }

  final _$toggleStatusAsyncAction = AsyncAction('_TodoStoreBase.toggleStatus');

  @override
  Future<TodoModel> toggleStatus(int index) {
    return _$toggleStatusAsyncAction.run(() => super.toggleStatus(index));
  }

  final _$editTodoAsyncAction = AsyncAction('_TodoStoreBase.editTodo');

  @override
  Future<TodoModel> editTodo(int index, {String? label, String? description}) {
    return _$editTodoAsyncAction.run(
        () => super.editTodo(index, label: label, description: description));
  }

  final _$deleteTodoAsyncAction = AsyncAction('_TodoStoreBase.deleteTodo');

  @override
  Future<void> deleteTodo(int index) {
    return _$deleteTodoAsyncAction.run(() => super.deleteTodo(index));
  }

  @override
  String toString() {
    return '''
todoList: ${todoList}
    ''';
  }
}
