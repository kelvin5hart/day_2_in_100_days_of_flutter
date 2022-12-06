import 'package:flutter/material.dart';

import '../controller/todo_controller.dart';
import '../model/todo_model.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({
    Key? key,
    required this.todoController,
    required this.index, required this.todayTask, this.subtitle,
  }) : super(key: key);

  final TodoController todoController;
  final List<Todo> todayTask;
  final int index;
  final String? subtitle;

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Dismissible(
          background: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Text(
                "This task has been deleted",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          key: Key(widget.todayTask[widget.index].id),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              widget.todoController
                  .deleteTodo(widget.todayTask[widget.index].id);
            }
          },
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                      strokeAlign: StrokeAlign.outside,
                      width: 2.0,
                      color: widget.todayTask[widget.index]
                                  .completed ==
                              true
                          ? Colors.grey
                          : widget.todayTask[widget.index].color),
                ),
                key: Key(widget.todayTask[widget.index].id),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                value: widget.todayTask[widget.index].completed,
                activeColor: Colors.grey,
                onChanged: (bool? value) {
                  setState(() {
                    widget.todayTask[widget.index].completed = value;
                  });
                },
              ),
            ),
            tileColor: Colors.white,
            title: Text(
              widget.todayTask[widget.index].description,
              style: TextStyle(
                  decoration:
                      widget.todayTask[widget.index].completed ==
                              true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  fontSize: 20,
                  color: widget.todayTask[widget.index].completed ==
                          true
                      ? Colors.grey
                      : Colors.black),
            ),
            subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
          ),
        ),
      ),
    );
  }
}
