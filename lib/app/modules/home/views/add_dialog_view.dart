import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddDialogView extends GetView {
  const AddDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddDialogView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddDialogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
