import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/modules/home/controllers/home_controller.dart';

class TaskCardView extends GetView<HomeController> {
  final Tasks tasks;
  const TaskCardView({
    required this.tasks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(tasks.color);
    final squareWidth = Get.width - 12.0.wp;
    return Stack(
      children: [
        Container(
          width: squareWidth / 2,
          height: squareWidth / 2,
          margin: EdgeInsets.all(3.0.wp),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 7,
              offset: const Offset(0, 7),
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // StepProgressIndicator(totalSteps: ),
              StepProgressIndicator(
                totalSteps: 100,
                currentStep: 80,
                size: 6,
                padding: 0,
                selectedColor: Colors.yellow,
                unselectedColor: Colors.cyan,
                roundedEdges: const Radius.circular(10),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.5), color],
                ),
                unselectedGradientColor: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.wp),
                child: Icon(
                  IconData(tasks.icon, fontFamily: "MaterialIcons"),
                  color: color,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.wp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tasks.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 2.0.wp),
                    Text(
                      '${tasks.todos?.length ?? 0} Tasks',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Obx(() => Visibility(
              visible: controller.willAccept.value,
              child: Container(
                margin: EdgeInsets.all(3.0.wp),
                width: squareWidth / 2,
                height: squareWidth / 2,
                color: Colors.red.withOpacity(0.5),
              ),
            )),
      ],
    );
  }
}
