
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_up_page.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayerList.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';

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
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height30, bottom: Dimensions.height30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  BigText(text: "Prayers For Today", size: Dimensions.height30, color: Colors.deepOrangeAccent,),
                  GestureDetector(
                    onTap: ()=>Get.to(()=> const SignUpPage()),
                    child: const CircleAvatar(
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


