import 'package:devtodollars/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devtodollars/services/todolist_notifier.dart';

class TodoListSection extends ConsumerWidget {
  const TodoListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final incompleteTodos = todos.where((todo) => !todo.isCompleted).toList();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(incompleteTodos.length, (index) {
          final todo = incompleteTodos[index];
          final isLastItem = index == incompleteTodos.length - 1;
          
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: isLastItem ? BorderSide.none : BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            child: TodoItem(todo: todo),
          );
        }),
      ),
    );
  }
}

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: todo.color.withOpacity(0.2),
        child: Icon(todo.icon, color: todo.color),
      ),
      title: Text(todo.text),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) {
          if (value != null) {
            // ref.read(todoListProvider.notifier).toggleTodoCompletion(todo.id);
          }
        },
      ),
    );
  }
}
