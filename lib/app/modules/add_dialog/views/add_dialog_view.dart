import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:todo_test/app/core/values/colors.dart';
import 'package:todo_test/app/modules/home/controllers/home_controller.dart';

class AddDialogView extends GetView<HomeController> {
  const AddDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
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
                    onPressed: () {
                      Get.back();
                      controller.changeTask(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      // wa9t tenzel 3al button ta3mel effect so hadhi tna7ih
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => {
                      if (controller.formKey.currentState!.validate())
                        {
                          if (controller.task.value == null)
                            {EasyLoading.showError("please select task type")}
                          else
                            {
                              if (controller.updateTask(
                                controller.task.value!,
                                controller.taskText.value,
                              ))
                                {
                                  EasyLoading.showSuccess(
                                      "Todo item add success"),
                                  Get.back(),
                                  controller.changeTask(null)
                                }
                              else
                                {
                                  EasyLoading.showError(
                                      "Todo item already exist")
                                }
                            }
                        }
                    },
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
                onSaved: (value) => controller.taskText.value = value!,
                validator: (value) => controller.validateTask(
                    value!, "please enter your todo item"),
                autofocus: true,
                // showCursor: false,
                cursorColor: blue,
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
            ...controller.tasks
                .map((element) => Obx(
                      () => InkWell(
                        onTap: () => controller.changeTask(element),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0.wp,
                            vertical: 3.0.wp,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(
                                    IconData(element.icon,
                                        fontFamily: "MaterialIcons"),
                                    color: HexColor.fromHex(element.color),
                                  ),
                                  SizedBox(
                                    width: 3.0.wp,
                                  ),
                                  Text(
                                    element.title,
                                    style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              if (controller.task.value == element)
                                Padding(
                                  padding: EdgeInsets.all(1.0.wp),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    ));
  }
}
