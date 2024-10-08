import 'package:devtodollars/services/metadata_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:devtodollars/services/auth_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devtodollars/components/background_layout.dart';
import 'package:devtodollars/components/header_section.dart';
import 'package:devtodollars/components/todolist_section.dart';
import 'package:devtodollars/components/todolistdone_section.dart';
import 'package:path/path.dart' as p;

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
          SafeArea(
            child: Column(
              children: [
                const HeaderSection(title: 'My Todo List'),
                Expanded(
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        const TodoListSection(),
                        const SizedBox(height: 20),
                        const Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TodoListDoneSection(),
                        const SizedBox(height: 50),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => context.push('/add'),
                                child: const Text('Add New Task'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
