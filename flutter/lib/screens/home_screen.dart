import 'package:devtodollars/services/metadata_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:devtodollars/services/auth_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devtodollars/components/background_layout.dart';
import 'package:devtodollars/components/header_section.dart';
import 'package:devtodollars/components/todolist_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey _todoListKey = GlobalKey();
  List<bool> _isChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLayout(),
          const HeaderSection(),
          const TodoListSection(),
          Positioned(
            top: (MediaQuery.of(context).size.height / 3) - 50,
            left: MediaQuery.of(context).size.width * 0.05,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {});
                });
                
                // Get the height of the todo list container
                final RenderBox? renderBox = _todoListKey.currentContext?.findRenderObject() as RenderBox?;
                final double todoListHeight = renderBox?.size.height ?? 0;

                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(top: todoListHeight + 20), // Add some spacing
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 3) - 50,
            left: MediaQuery.of(context).size.width * 0.05,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {});
                });
                
                final RenderBox? todoListRenderBox = _todoListKey.currentContext?.findRenderObject() as RenderBox?;
                final double todoListHeight = todoListRenderBox?.size.height ?? 0;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(top: todoListHeight + 20),
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildCompletedTodoItem('Finish project', Icons.task_alt, Colors.orange),
                          _buildDivider(),
                          _buildCompletedTodoItem('Buy groceries', Icons.shopping_cart, Colors.teal),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add New Task'),
                ),
              )
            )
          )
        ],
      ),
    );
  }

  Widget _buildTodoItem(String text, IconData icon, Color color, int index) {
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
          Expanded(child: Text(text)),
          Checkbox(
            value: _isChecked[index],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[index] = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildCompletedTodoItem(String text, IconData icon, Color color) {
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
          const Checkbox(
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
