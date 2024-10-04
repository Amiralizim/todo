import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String text;
  final IconData icon;
  final Color color;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    required this.icon,
    required this.color,
    this.isCompleted = false,
  });

  Todo copyWith({
    String? id,
    String? text,
    IconData? icon,
    Color? color,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          icon == other.icon &&
          color == other.color &&
          isCompleted == other.isCompleted;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      icon.hashCode ^
      color.hashCode ^
      isCompleted.hashCode;

  @override
  String toString() {
    return 'Todo{id: $id, text: $text, icon: $icon, color: $color, isCompleted: $isCompleted}';
  }
}
