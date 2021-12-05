import 'package:equatable/equatable.dart';

import '../domain.dart';

class TodoListModel extends Equatable {
  final List<TodoModel> todos;

  @override
  List<Object?> get props => [todos];

  TodoListModel({List<TodoModel>? initialList})
      : todos = initialList ?? List.empty(growable: true);
}
