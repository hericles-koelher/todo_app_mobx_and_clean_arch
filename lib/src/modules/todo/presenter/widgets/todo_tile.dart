import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_mobx/src/modules/todo/todo.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final FutureOr<void> Function({required String label, String? description})?
      onEdit;
  final void Function(bool?)? onCheckboxChanged;
  final void Function()? onDismissed;

  const TodoTile({
    Key? key,
    required this.todo,
    this.onEdit,
    this.onCheckboxChanged,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        dismissible: onDismissed != null
            ? DismissiblePane(onDismissed: onDismissed!)
            : null,
        children: [
          if (onDismissed != null)
            SlidableAction(
              onPressed: (_) => onDismissed!(),
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          if (onEdit != null)
            SlidableAction(
              onPressed: (context) => showEditModal(context),
              backgroundColor: Colors.lime,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
        ],
      ),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          title: Text(
            todo.label,
            style: todo.status
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  )
                : null,
          ),
          subtitle: todo.description != null
              ? Text(
                  todo.description!,
                  style: todo.status
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                        )
                      : null,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          trailing: Checkbox(
            value: todo.status,
            onChanged: onCheckboxChanged,
          ),
        ),
      ),
    );
  }

  void showEditModal(BuildContext context) {
    const double borderRadius = 25;

    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      builder: (_) => TodoForm.edit(
        originalLabel: todo.label,
        originalDescription: todo.description,
        save: onEdit!,
      ),
    );
  }
}
