import 'package:firedart_example/module/login/view/login_view.dart';
import 'package:firedart_example/module/main_navigation/view/main_navigation_view.dart';
import 'package:fireverse/fireverse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Fire.initialize(
    apiKey: "AIzaSyAjaGYDdHvb0_vsG3JRS6ZVUegaicjn5Uo",
    projectId: "freeproject-c8687",
    appId: "1:803703594987:web:1eab5d874a2b50260783ae",
    messagingSenderId: "803703594987",
  );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Fire.currentUser == null ? LoginView() : MainNavigationView(),
  ));
}
