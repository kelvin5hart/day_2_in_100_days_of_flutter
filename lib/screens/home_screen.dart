import 'package:day_2_in_100_days_of_flutter/controller/todo_controller.dart';
import 'package:day_2_in_100_days_of_flutter/screens/write_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/todo_model.dart';
import '../widgets/menu_widget.dart';
import '../widgets/task_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    return Scaffold(
      backgroundColor: const Color(0xFFDDE3F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF91A0C1),
        leading: const MenuWidget(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xFFDDE3F8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Text(
                    "What's Up, Kelvin",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF91A0C1)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF91A0C1)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 2 / 1.5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "30 Tasks",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xFF91A0C1)),
                                ),
                                Text(
                                  "Business",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF91A0C1)),
                                ),
                                LinearProgressIndicator(
                                  minHeight: 8,
                                  backgroundColor: Colors.black45,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink,),
                                  value: 0.8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Text(
                    "Today's Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF91A0C1)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              List<Todo>  newList = todoController.todos.where((element) => DateFormat("EEEE dd-MM-yy")
                  .format(element.dateTime) == DateFormat("EEEE dd-MM-yy")
                  .format(DateTime.now())).toList();
              print(newList);
              return todoController.todos.isEmpty
                  ? const Center(
                      child: Text(
                        "No Tasks Today",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0x7091A0C1),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: newList.length,
                      itemBuilder: (context, index) {
                        return TaskTileWidget(
                          todoController: todoController,
                          index: index, todayTask: newList,
                        );
                      });
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const WriteTodoScreen());
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
