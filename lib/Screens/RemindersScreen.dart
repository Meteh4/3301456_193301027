import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:preview_1/Models/todo_list.dart';
import 'package:sqflite/sqflite.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  List<Map<String, dynamic>> todos = [];
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();
  @override
  void dispose() {
    todoTitleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _databaseInit();
    super.initState();
  }

  _databaseInit() async {
    print(await getDatabasesPath());
    final database = openDatabase(
      join(await getDatabasesPath(), 'todos_database.db'),
      onCreate: (db, version) async {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT);',
        );
      },
      version: 1,
    );
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    for (var map in maps) {
      map = {
        'title': map['title'],
        'description': map['description'],
      };

      setState(() {
        todos.add(map);
      });
    }
  }

  _databaseInsert() async {
    print(await getDatabasesPath());
    final database = openDatabase(
      join(await getDatabasesPath(), 'todos_database.db'),
      version: 1,
    );
    final db = await database;
    await db.delete('todos');
    for (var i = 0; i < todos.length; i++) {
      await db.insert(
        'todos',
        {
          'title': todos[i]['title'],
          'description': todos[i]['description'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TodoList(
          todos: todos,
          function: _databaseInsert,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              todoTitleController.clear();
              todoDescriptionController.clear();
              return AlertDialog(
                backgroundColor: const Color(0xFFFEEAE6),
                title: const Text("New note"),
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: todoTitleController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        strutStyle: StrutStyle.disabled,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: todoDescriptionController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 4,
                        strutStyle: StrutStyle.disabled,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todos.add({
                              'title': todoTitleController.text,
                              'description': todoDescriptionController.text,
                            });
                            _databaseInsert();
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: const Color(0xFF7D4F52),
        child: const Icon(Icons.add_rounded),
        tooltip: 'New Note',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
