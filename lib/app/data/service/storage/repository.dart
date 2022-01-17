import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/data/providers/tasks/providers.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({
    required this.taskProvider,
  });

  List<Tasks> readTasks() => taskProvider.readTasks();

  void writeTasks(List<Tasks> tasks) => taskProvider.writeTasks(tasks);
}
