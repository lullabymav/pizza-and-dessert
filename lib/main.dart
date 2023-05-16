import 'package:final_project_tpm_pizza/ui/homepage.dart';
import 'package:final_project_tpm_pizza/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
late Box box1;

void main() async {
  await Hive.initFlutter();
  box1 = await Hive.openBox('logindata');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: box1.get('isLoggied', defaultValue: false) ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
