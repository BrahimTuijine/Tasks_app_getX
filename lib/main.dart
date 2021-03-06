import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_test/app/data/service/storage/services.dart';
import 'package:todo_test/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  runApp(
    GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: appTheme(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
