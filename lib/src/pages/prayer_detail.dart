import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_in_page.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/small_text.dart';

import '../../widget/big_text.dart';

class PrayerDetails extends StatelessWidget {
  const PrayerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Center(child: BigText(text: DateFormat.MMMd().format(DateTime.now()), size: 30,)),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2)
                ),
                child: Padding(padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("James 1:17", style: textHeadingStyle,),
                    Text(textAlign: TextAlign.center,"Every good and perfect gift is from above, coming down from the Father of the heavenly lights, who does not change like shifting shadows.", style: textHeadingStyle,),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios, color: Colors.deepOrangeAccent,),
      ),
      title: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: 18,),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: ()=>Get.to(const SignInPage()),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.deepOrangeAccent,),
          ),
        )
      ],
    );
  }
}
