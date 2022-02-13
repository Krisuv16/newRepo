import 'package:ambulance/controller/ambulance.dart';
import 'package:ambulance/view/ambulance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> initialize() async {
  Get.lazyPut(() => AmbulanceController());
}

Future main() async {
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Ambulance(),
    );
  }
}
