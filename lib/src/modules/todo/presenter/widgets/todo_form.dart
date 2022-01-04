import 'dart:async';

import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final String? label;
  final String? description;
  final FutureOr<void> Function({
    required String label,
    String? description,
  }) save;
  final String confirmLabel;

  const TodoForm._({
    Key? key,
    this.label,
    this.description,
    required this.save,
    required this.confirmLabel,
  }) : super(key: key);

  factory TodoForm.create(
      {required FutureOr<void> Function({
        required String label,
        String? description,
      })
          save}) {
    return TodoForm._(
      save: save,
      confirmLabel: "Create",
    );
  }

  factory TodoForm.edit(
      {required String originalLabel,
      String? originalDescription,
      required FutureOr<void> Function({
        required String label,
        String? description,
      })
          save}) {
    return TodoForm._(
      label: originalLabel,
      description: originalDescription,
      save: save,
      confirmLabel: "Edit",
    );
  }

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  late final TextEditingController _labelController;
  late final TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _labelController = TextEditingController(text: widget.label);
    _descriptionController = TextEditingController(text: widget.description);

    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _labelController,
              validator: (String? str) {
                if (str == null || str.isEmpty) {
                  return "Please, give your todo a label.";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                labelText: "Label*",
                helperText: "*Required",
              ),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.save(
                        label: _labelController.text,
                        description: _descriptionController.text,
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.confirmLabel),
                ),
              ],
            ),
            // Odeio essa gambiarra pra jogar os itens do modal pra cima
            // quando o teclado aparece.
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
