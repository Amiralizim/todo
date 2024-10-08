import 'package:devtodollars/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devtodollars/services/todolist_notifier.dart';

class TodoListDoneSection extends ConsumerWidget {
  const TodoListDoneSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListNotifierProvider);
    final completedTodos = todos.where((todo) => todo.isCompleted).toList();
    
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
        children: List.generate(completedTodos.length, (index) {
          final todo = completedTodos[index];
          final isLastItem = index == completedTodos.length - 1;
          
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: isLastItem ? BorderSide.none : BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            child: _buildCompletedTodoItem(todo.text, todo.icon, todo.color, ref, todo.id),
          );
        }),
      ),
    );
  }

  Widget _buildCompletedTodoItem(String text, IconData icon, Color color, WidgetRef ref, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(decoration: TextDecoration.lineThrough))),
          Checkbox(
            value: true,
            onChanged: (bool? value) {
              ref.read(todoListNotifierProvider.notifier).toggleTodo(id);
            },
          ),
        ],
      ),
    );
  }
}
