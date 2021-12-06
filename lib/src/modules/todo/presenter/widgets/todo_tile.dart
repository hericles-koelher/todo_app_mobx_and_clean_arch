import 'package:flutter/material.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final void Function(bool?) onCheckboxChanged;

  const TodoTile({
    Key? key,
    required this.todo,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        isThreeLine: true,
        title: Text(todo.label),
        subtitle: todo.description != null
            ? Text(
                todo.description!,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: Checkbox(
          value: todo.status,
          onChanged: onCheckboxChanged,
        ),
      ),
    );
  }
}
