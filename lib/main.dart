import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prophetic_prayers_for_children/src/db/db_helper.dart';
import 'package:prophetic_prayers_for_children/src/pages/landing_page.dart';

 Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await DBHelper.initBD();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LandingPage()
    );
  }
}


