import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_in_page.dart';
import 'package:prophetic_prayers_for_children/widget/small_text.dart';

import '../../widget/big_text.dart';

class PrayerDetails extends StatelessWidget {
  const PrayerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        decoration: BoxDecoration(
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
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Center(child: SmallText(text: "James 1:17 Every good and perfect gift is from above, coming down from the Father of the heavenly lights, who does not change like shifting shadows.",)),
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
        child: Icon(Icons.arrow_back_ios, color: Colors.deepOrangeAccent,),
      ),
      title: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: 18,),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: ()=>Get.to(SignInPage()),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.deepOrangeAccent,),
          ),
        )
      ],
    );
  }
}
