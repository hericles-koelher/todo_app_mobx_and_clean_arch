import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final String? label;
  final String? description;
  final void Function({required String label, String? description}) done;

  const TodoForm({
    Key? key,
    this.label,
    this.description,
    required this.done,
  }) : super(key: key);

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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
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
            const Spacer(),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.done(
                        label: _labelController.text,
                        description: _descriptionController.text,
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Create"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
