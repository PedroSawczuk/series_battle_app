import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:series_battle/firebase_options.dart';
import 'views/homePage.dart';

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    )
  );
}
