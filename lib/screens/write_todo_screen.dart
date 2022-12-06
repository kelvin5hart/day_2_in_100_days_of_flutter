import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/todo_controller.dart';
import '../model/todo_model.dart';

class WriteTodoScreen extends StatefulWidget {
  const WriteTodoScreen({Key? key}) : super(key: key);

  @override
  State<WriteTodoScreen> createState() => _WriteTodoScreenState();
}

class _WriteTodoScreenState extends State<WriteTodoScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final TodoController todoController = Get.put(TodoController());
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, foregroundColor: Colors.black,),
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            if (textEditingController.text.isEmpty) {
              todoController.selectedDate.value = DateTime.now();
              Get.back();
            } else {
              todoController.addTodo(Todo(
                  dateTime: todoController.selectedDate.value,
                  color: color,
                  category: "Category",
                  description: textEditingController.text));
              todoController.selectedDate.value = DateTime.now();
              Get.back();
            }
          },
          child: const Text("New Task", style: TextStyle(fontSize: 20)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textEditingController,
              maxLines: 5,
              minLines: 1,
              style: const TextStyle(fontSize: 30),
              decoration: const InputDecoration(
                  hintText: "Enter New Task",
                  hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    todoController.chooseDate();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: Colors.black12)),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded,
                            size: 30, color: Colors.black45),
                        Obx(() {
                          return Text(
                            DateFormat("E dd-MM-yy").format(
                                        todoController.selectedDate.value) ==
                                    DateFormat("E dd-MM-yy")
                                        .format(DateTime.now())
                                ? "Today"
                                : DateFormat("E dd-MM-yy")
                                    .format(todoController.selectedDate.value)
                                    .toString(),
                            style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Pick a Color",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 26),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlockPicker(
                                pickerColor: Colors.blue, //default color
                                onColorChanged: (Color newColor) {
                                  setState(() {
                                    color = newColor;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: Colors.black12)),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 5, color: color)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: color),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: Colors.black12)),
                    child: const Icon(Icons.folder_copy_outlined,
                        size: 30, color: Colors.black45),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
