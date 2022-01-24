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

  @override
  void onInit() {
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
    super.onInit();
  }

  String? validateTask(String value , String mess) {
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


}
