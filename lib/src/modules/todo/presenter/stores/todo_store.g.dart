// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStoreBase, Store {
  Computed<List<TodoModel>>? _$todoListComputed;

  @override
  List<TodoModel> get todoList =>
      (_$todoListComputed ??= Computed<List<TodoModel>>(() => super.todoList,
              name: '_TodoStoreBase.todoList'))
          .value;

  final _$_todoListAtom = Atom(name: '_TodoStoreBase._todoList');

  @override
  List<TodoModel> get _todoList {
    _$_todoListAtom.reportRead();
    return super._todoList;
  }

  @override
  set _todoList(List<TodoModel> value) {
    _$_todoListAtom.reportWrite(value, super._todoList, () {
      super._todoList = value;
    });
  }

  final _$createTodoAsyncAction = AsyncAction('_TodoStoreBase.createTodo');

  @override
  Future<void> createTodo({required String label, String? description}) {
    return _$createTodoAsyncAction
        .run(() => super.createTodo(label: label, description: description));
  }

  final _$updateTodoAsyncAction = AsyncAction('_TodoStoreBase.updateTodo');

  @override
  Future<void> updateTodo(int index,
      {String? label, String? description, bool? status}) {
    return _$updateTodoAsyncAction.run(() => super.updateTodo(index,
        label: label, description: description, status: status));
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
