import 'package:get/get.dart';
import 'package:todo_test/app/data/providers/tasks/providers.dart';
import 'package:todo_test/app/data/service/storage/repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
