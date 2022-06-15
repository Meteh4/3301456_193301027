import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
    required this.todos,
    required this.function,
  }) : super(key: key);
  final List<Map<String, dynamic>> todos;
  final ValueGetter function;
  @override
  _TodoListState createState() => _TodoListState();
}

ColorScheme colorScheme = const ColorScheme(
  primary: Color(0xFFFEEAE6),
  secondary: Color(0xFFFEEAE6),
  surface: Color(0xff28262D),
  background: Color(0xff1C1B1F),
  error: Color(0xffF2B8B5),
  onPrimary: Color(0xff381E72),
  onSecondary: Color(0xff332D41),
  onSurface: Color(0xffE6E1E5),
  onBackground: Color(0xffE6E1E5),
  onError: Color(0xff601410),
  brightness: Brightness.dark,
);

class _TodoListState extends State<TodoList> {
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return widget.todos.isEmpty
        ? const Text('Create your first note!')
        : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: widget.todos.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        todoTitleController.text = widget.todos[index]['title'];
                        todoDescriptionController.text =
                            widget.todos[index]['description'];
                        return AlertDialog(
                          backgroundColor: const Color(0xFFFEEAE6),
                          title: const Text("Edit note"),
                          content: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 40),
                                TextFormField(
                                  controller: todoTitleController,
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
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
                                      widget.todos.removeAt(index);
                                      widget.todos.insert(index, {
                                        'title': todoTitleController.text,
                                        'description':
                                            todoDescriptionController.text,
                                      });
                                      widget.function();
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.surface,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(height: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              widget.todos[index]['title'].toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 22,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF7D4F52),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.todos[index]['description'].toString(),
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7D4F52),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Map<String, dynamic> todo = widget.todos[index];
                            widget.todos.removeAt(index);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            widget.todos.remove(todo);
                            widget.function();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFFEEAE6),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      widget.todos.insert(index, todo);
                                      widget.function();
                                    });
                                  },
                                ),
                                content: Row(
                                  children: [
                                    Text(
                                      todo['title'] + ' deleted! ',
                                      style: const TextStyle(
                                        color: Color(0xFF7D4F52),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.delete,
                          size: 24,
                          color: Color(0xFF7D4F52),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}
