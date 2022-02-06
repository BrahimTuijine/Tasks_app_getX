import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_test/app/data/models/tasks.dart';

import 'package:todo_test/app/data/service/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({
    required this.taskRepository,
  });
  final formKey = GlobalKey<FormState>();
  final tasks = <Tasks>[].obs;
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final title = "".obs;
  final willAccept = false.obs;
  final task = Rx<Tasks?>(null);
  final taskText = "".obs;

  @override
  void onInit() {
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
    super.onInit();
  }

  String? validateTask(String value, String mess) {
    if (value.isEmpty || value.trim().isEmpty || value.length <= 2) {
      return mess;
    }
    return null;
  }

  void changeShipIndex(int value) => chipIndex.value = value;

  bool addTask(Tasks task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void changedeleting(bool value) => deleting.value = value;

  void deletetingTask(Tasks task) => tasks.remove(task);

  void changeTask(Tasks? selected) => task.value = selected;

  updateTask(Tasks task, String text) {
    var todos = task.todos ?? [];
    if (containTodo(todos, text)) {
      return false;
    }
    Map<String, dynamic> todo = {
      "title": text,
      "done": false,
    };
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    int oldx = tasks.indexOf(task);
    tasks[oldx] = newTask;
    tasks.refresh();
    return true;
  }

  bool containTodo(List todos, String titles) {
    return todos.any((element) => element["title"] == titles);
  }
}
