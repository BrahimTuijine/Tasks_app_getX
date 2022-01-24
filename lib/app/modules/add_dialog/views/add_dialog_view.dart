import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:todo_test/app/modules/home/controllers/home_controller.dart';

class AddDialogView extends GetView<HomeController> {
  const AddDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(3.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  color: Colors.grey,
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
                TextButton(
                  style: ButtonStyle(
                    // wa9t tenzel 3al button ta3mel effect so hadhi tna7ih
                    overlayColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 14.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Text(
              'New Task',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 3.0.hp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: TextFormField(
              validator: (value) => controller.validateTask(
                  value!, "please enter your todo item"),
              autofocus: true,
              showCursor: false,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0.hp),
            child: Text(
              'Add to ',
              style: TextStyle(
                fontSize: 15.0.sp,
                color: Colors.grey,
              ),
            ),
          ),
          ...controller.tasks.map((element) =>Row(
            children: <Widget>[
              
            ],
          )).toList(),
        ],
      ),
    ));
  }
}
