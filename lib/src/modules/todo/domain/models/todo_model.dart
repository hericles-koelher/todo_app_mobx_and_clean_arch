import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String label;
  final String? description;
  final bool status;

  @override
  List<Object?> get props => [id, label, description, status];

  const TodoModel({
    required this.id,
    required this.label,
    this.description,
    this.status = false,
  });

  TodoModel copyWith({
    String? id,
    String? label,
    String? description,
    bool? status,
  }) =>
      TodoModel(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        status: status ?? this.status,
      );
}
