import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_mobx/src/modules/todo/domain/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final void Function(bool?) onCheckboxChanged;
  final void Function() onDismissed;

  const TodoTile({
    Key? key,
    required this.todo,
    required this.onCheckboxChanged,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        dismissible: DismissiblePane(onDismissed: onDismissed),
        children: [
          SlidableAction(
            onPressed: (_) => onDismissed(),
            // Hardcoded test colors.
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
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
}
