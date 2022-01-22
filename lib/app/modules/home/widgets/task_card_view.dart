import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Container(
      width: squareWidth /2,
      height: squareWidth /2,
      margin:  EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:  [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0,7),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: const <Widget>[
          
        ],
      ),
    );
  }
}
