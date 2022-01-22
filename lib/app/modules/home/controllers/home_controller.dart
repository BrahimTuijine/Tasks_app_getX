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
  final title = "".obs;

  @override
  void onInit() {
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
    super.onInit();
  }

  String? validateTitle(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "please enter your task title";
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
}
