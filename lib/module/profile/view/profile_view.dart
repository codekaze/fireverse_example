import 'package:flutter/material.dart';
import '../controller/profile_controller.dart';

import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
          ),
        );
      },
    );
  }
}