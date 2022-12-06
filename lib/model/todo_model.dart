import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String description;
  bool? completed;
  String category;
  DateTime dateTime;
  Color color;

  Todo({
    this.category = "Personal",
    required this.description,
    this.color = Colors.blue,
    this.completed = false,
    required this.dateTime
  })  : id = const Uuid().v1();
}

