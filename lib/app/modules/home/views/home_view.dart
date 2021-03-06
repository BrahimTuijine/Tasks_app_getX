import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:todo_test/app/core/values/colors.dart';
import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/modules/add_dialog/views/add_dialog_view.dart';
import 'package:todo_test/app/modules/home/widgets/card_view.dart';
import 'package:todo_test/app/modules/home/widgets/task_card_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final squareWidth = Get.width - 12.0.wp;
    return Scaffold(
        floatingActionButton: DragTarget<Tasks>(
          onLeave: (_) => controller.willAccept.value = false,
          onWillAccept: (_) => controller.willAccept.value = true,
          onAccept: (task) {
            controller.willAccept.value = false;
            controller.deletetingTask(task);
            EasyLoading.showSuccess("task deleted");
          },
          builder: (_, __, ___) {
            return Obx(
              () => Container(
                margin: EdgeInsets.only(
                    right: Get.width * .1 / 4, bottom: Get.width * .1 / 4),
                child: FloatingActionButton(
                  onPressed: () => Get.to(
                    () => const AddDialogView(),
                    transition: Transition.downToUp,
                  ),
                  child: Icon(
                    controller.deleting.value ? Icons.delete : Icons.add,
                  ),
                  backgroundColor:
                      controller.deleting.value ? Colors.red : blue,
                ),
              ),
            );
          },
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  'My List',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Obx(() => GridView.count(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: [
                            ...controller.tasks
                                .map(
                                  (element) => LongPressDraggable(
                                    data: element,
                                    onDragStarted: () =>
                                        controller.changedeleting(true),
                                    onDraggableCanceled: (_, __) =>
                                        controller.changedeleting(false),
                                    onDragEnd: (_) =>
                                        controller.changedeleting(false),
                                    feedback: Stack(
                                      children: [
                                        Opacity(
                                          opacity: 0.8,
                                          child: TaskCardView(tasks: element),
                                        ),
                                        Obx(() => Visibility(
                                              visible:
                                                  controller.willAccept.value,
                                              child: Container(
                                                margin: EdgeInsets.all(3.0.wp),
                                                width: squareWidth / 2,
                                                height: squareWidth / 2,
                                                color:
                                                    Colors.red.withOpacity(0.5),
                                              ),
                                            )),
                                      ],
                                    ),
                                    child: TaskCardView(tasks: element),
                                  ),
                                )
                                .toList(),
                            const CardView(),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
