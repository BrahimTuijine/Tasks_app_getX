import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_test/app/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:todo_test/app/core/values/colors.dart';
import 'package:todo_test/app/core/widgets/icons.dart';
import 'package:todo_test/app/data/models/tasks.dart';
import 'package:todo_test/app/modules/home/controllers/home_controller.dart';

class CardView extends GetView<HomeController> {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Icon> icons = getIcons();
    double squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: "task type",
              content: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Title",
                        ),
                        validator: (value) => controller.validateTitle(value!),
                        onSaved: (value) => controller.title.value = value!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                      child: Wrap(
                        spacing: 2.0.wp,
                        children: icons
                            .map((e) => Obx(() {
                                  final index = icons.indexOf(e);
                                  return ChoiceChip(
                                    label: e,
                                    selectedColor: Colors.grey[200],
                                    pressElevation: 0,
                                    backgroundColor: Colors.white,
                                    selected:
                                        controller.chipIndex.value == index,
                                    onSelected: (bool selected) {
                                      controller.chipIndex.value =
                                          selected ? index : 0;
                                    },
                                  );
                                }))
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          int icon =
                              icons[controller.chipIndex.value].icon!.codePoint;
                          String color =
                              icons[controller.chipIndex.value].color!.toHex();
                          var task = Tasks(
                            title: controller.title.value,
                            icon: icon,
                            color: color,
                          );
                          Get.back();
                          controller.addTask(task)
                              ? EasyLoading.showSuccess("Create success")
                              : EasyLoading.showError("Dublicate Task");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(150, 40)),
                      child: const Text(
                        "confirm",
                      ),
                    ),
                  ],
                ),
              ));
          controller.changeShipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
