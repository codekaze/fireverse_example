import 'dart:developer';

import 'package:firedart_example/module/login/widget/blur_login_view.dart';
import 'package:fireverse/fireverse.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return BlurLoginView(
          onLogin: (email, password) async {
            log("email: $email");
            log("password: $password");

            try {
              await Fire.signIn(
                email: email!,
                password: password!,
              );
            } on Exception catch (_) {
              Get.snackbar("Error", "Login Failed");
              return;
            }

            if (Fire.currentUser != null) {
              var moduleName = "product";

              await Fire.add(collectionName: moduleName, value: {
                "product_name": "Super Cat",
                "price": 24,
                "created_at": Fire.timestamp(),
              });
              log("success?");

              log("get $moduleName?");
              var res = await Fire.get(
                collectionName: moduleName,
              );
              print(res);
              print(res.length);

              // Get.deleteAll();
              // Get.offAll(MainNavigationView());
            }
          },
        );
      },
    );
  }
}
