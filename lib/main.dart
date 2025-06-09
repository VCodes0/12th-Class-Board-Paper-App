import 'package:board_paper/Controller/jee_advanced_controller.dart';
import 'package:board_paper/Controller/jeemains_controller.dart';
import 'package:board_paper/Controller/mh_cet_controller.dart';
import 'package:board_paper/Controller/neet_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'View/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JeeMainsController()),
        ChangeNotifierProvider(create: (context) => JeeAdvancedController()),
        ChangeNotifierProvider(create: (context) => MhCetController()),
        ChangeNotifierProvider(create: (context) => NeetController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
