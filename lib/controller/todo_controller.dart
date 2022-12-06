import 'package:get/get.dart';
import '../model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoController extends GetxController {
  final RxList<Todo> _todos = <Todo>[].obs;
  List<Todo> get todos => _todos;

  var selectedDate = DateTime.now().obs;

  addTodo(Todo todo) {
    _todos.insert(0, todo);
    update();
  }

  deleteTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    update();
  }

  changeStatus(Todo todo) {
    int index = _todos.indexOf(todo);
    _todos[index].completed = _todos[index].completed;
    update();
  }

  updateTodo(Todo oldTodo, String newDescription) {
    int index = _todos.indexOf(oldTodo);
    _todos[index].description = newDescription;
    update();
  }

  chooseDate() async {
    DateTime? pickDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023));
    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
    }
  }
}

