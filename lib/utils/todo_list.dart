import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key,
  required this.taskname,
  required this.taskCompleted,
   required this.onChanged, required this.deletefunction});

  final String taskname;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletefunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 0,
            ),
            child: Slidable(
              endActionPane: ActionPane(motion: StretchMotion(),
              children: 
                [
                  SlidableAction(
                  onPressed: deletefunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 68, 132, 211),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                Row(
                  children: [
                    Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      taskname
                    ,style:  TextStyle(color: Colors.white,fontSize: 18,
                    decoration: taskCompleted ? 
                    TextDecoration.lineThrough 
                    : TextDecoration.none,
                    decorationColor: Colors.black,
                    decorationThickness: 3,
                    ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
  }
}