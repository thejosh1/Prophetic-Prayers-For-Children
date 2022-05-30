import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_up_page.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayerList.dart';

import '../../widget/big_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
            //header
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  BigText(text: "Prayers For Today", size: 30, color: Colors.deepOrangeAccent,),
                  GestureDetector(
                    onTap: ()=>Get.to(SignUpPage()),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.deepOrangeAccent,),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SingleChildScrollView(child: PrayerList(),))
          ],
        ),
      ),
    );
  }

}


