import 'package:devtodollars/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todolist_notifier.g.dart';
// class TodoListNotifier extends StateNotifier<List<Todo>> {
//   TodoListNotifier() : super([
//     Todo(id: '1', text: 'Study lesson', icon: Icons.book, color: Colors.blue),
//     Todo(id: '2', text: 'Run 5k', icon: Icons.directions_run, color: Colors.green),
//     Todo(id: '3', text: 'Go to party', icon: Icons.celebration, color: Colors.purple),
//     Todo(id: '4', text: 'Finish project', icon: Icons.task_alt, color: Colors.orange, isCompleted: true),
//     Todo(id: '5', text: 'Buy groceries', icon: Icons.shopping_cart, color: Colors.teal, isCompleted: true),
//   ]);

//     void toggleTodo(String id) {
//     state = [
//       for (final todo in state)
//         if (todo.id == id)
//           todo.copyWith(isCompleted: !todo.isCompleted)
//         else
//           todo,
//     ];
//   }
// }

// final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
//   return TodoListNotifier();
//});

final List<Todo> allTodos = [
    Todo(id: '1', text: 'Study lesson', icon: Icons.book, color: Colors.blue),
    Todo(id: '2', text: 'Run 5k', icon: Icons.directions_run, color: Colors.green),
    Todo(id: '3', text: 'Go to party', icon: Icons.celebration, color: Colors.purple),
    Todo(id: '4', text: 'Finish project', icon: Icons.task_alt, color: Colors.orange, isCompleted: true),
    Todo(id: '5', text: 'Buy groceries', icon: Icons.shopping_cart, color: Colors.teal, isCompleted: true),
];

@riverpod 
List<Todo> todoList(ref) {
  return allTodos;
}