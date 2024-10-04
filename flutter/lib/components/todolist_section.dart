import 'package:devtodollars/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devtodollars/services/todolist_notifier.dart';

class TodoListSection extends ConsumerWidget {
  const TodoListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    
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
        children: todos
            .where((todo) => !todo.isCompleted)
            .map((todo) => TodoItem(todo: todo))
            .toList(),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.icon, color: todo.color),
      title: Text(todo.text),
      // Add more UI elements as needed
    );
  }
}