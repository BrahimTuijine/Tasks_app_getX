import 'dart:convert';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:todo_test/app/core/utils/keys.dart';
import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/data/service/storage/services.dart';

class TaskProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<Tasks> readTasks() {
    List<Tasks> tasks = <Tasks>[];
    jsonDecode(_storage.read(taskkey).toString())
        .forEach((e) => {tasks.add(Tasks.fromJson(e))});
    return tasks;
  }

  void writeTasks(List<Tasks> tasks) {
    _storage.write(taskkey, jsonEncode(tasks));
  }
}
