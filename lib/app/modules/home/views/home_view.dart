import 'package:flutter/material.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/modules/home/widgets/card_view.dart';
import 'package:todo_test/app/modules/home/widgets/task_card_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
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
        GridView.count(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: const [
            TaskCardView(
              tasks: Tasks(title: "title", icon: 0xe59c, color: "#FF2B60E6"),
            ),
            CardView(),
          ],
        )
      ],
    ));
  }
}
