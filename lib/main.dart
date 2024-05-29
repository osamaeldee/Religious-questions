import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/Homepage/Home_Page.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('sharedValue', 10);
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Verifications());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home_Page(),
    );
  }
}
