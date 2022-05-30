import 'package:flutter/material.dart';
import 'package:prophetic_prayers_for_children/src/pages/notifications_page.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayerList.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayer_detail.dart';
import 'package:prophetic_prayers_for_children/src/pages/set_reminders.dart';
import 'package:prophetic_prayers_for_children/widget/input_field.dart';

import 'src/pages/landing_page.dart';
import 'src/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SetReminders(),
    );
  }
}


