import 'package:flutter/material.dart';
import 'package:to_dolist_flutter/utils/todo_list.dart'; // Ensure the path is correct for your TodoList class.


class HomePage extends StatefulWidget { // Fixed naming convention for Dart.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final List<List<dynamic>> todo = [
    ['Continue the new course', false],
    ['Continue the new course of ', false],
    ['Continue the new course of ', false],
  ];

  void checkboxChange(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }
  void add_taks()
  {
    setState(() {
      todo.add([_controller.text, false]);
      _controller.clear();
    });
  }
  
  void delete_task(int index) {
    setState(() {
      todo.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 227, 255),
      appBar: AppBar(
        title: const Text('Sample ToDo'),
        backgroundColor: const Color.fromARGB(255, 118, 183, 237),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return TodoList(
            taskname: todo[index][0],
            taskCompleted: todo[index][1],
            onChanged: (value) => checkboxChange(index),
            deletefunction: (context) => delete_task(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add new Taks',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 43, 67, 222),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              ),
            )
            ),
          FloatingActionButton(onPressed: add_taks,
          child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

//controller