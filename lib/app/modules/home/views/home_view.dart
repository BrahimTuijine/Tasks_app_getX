import 'package:flutter/material.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:todo_test/app/modules/home/widgets/card_view.dart';
import 'package:todo_test/app/modules/home/widgets/task_card_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
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
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: [
                            ...controller.tasks
                                .map(
                                  (element) => LongPressDraggable(
                                    onDragStarted: () =>
                                        controller.changedeleting(true),
                                    onDraggableCanceled: (_, __) {},
                                    feedback: Opacity(
                                      opacity: 0.8,
                                      child: TaskCardView(tasks: element),
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
