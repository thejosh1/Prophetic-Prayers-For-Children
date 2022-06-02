import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_in_page.dart';
import 'package:prophetic_prayers_for_children/src/pages/main_page.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';
import 'package:prophetic_prayers_for_children/widget/big_text.dart';
import 'package:prophetic_prayers_for_children/widget/small_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  width: 250,
                  child: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: Dimensions.width20,),
                  ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> const MainPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: Dimensions.bottom200),
                    width: Dimensions.width250,
                    height: Dimensions.height60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.deepOrangeAccent,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        tileMode: TileMode.mirror
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.height20)
                    ),
                    child: Center(
                        child: BigText(text: "Get Started", color: Colors.white,)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Powered by the army of david ministries", color: Colors.deepOrangeAccent, size: Dimensions.width12,),
                      GestureDetector(
                        onTap: (){
                          //Navigation Route
                          Get.to(()=> const SignInPage());
                        },
                          child: SmallText(text: "?Sign in", color: Colors.purple, size: Dimensions.width12,))
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
