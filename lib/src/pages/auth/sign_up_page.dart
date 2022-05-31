import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_in_page.dart';

import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 250,
                  height: 60,
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
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //Navigation Route
                    },
                    child: Center(
                        child: BigText(text: "Sign Up With Email", color: Colors.white,)),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  width: 250,
                  height: 60,
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
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //Navigation Route
                    },
                    child: Center(
                        child: BigText(text: "Sign Up With Google", color: Colors.white,)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Powered by the army of david ministries", color: Colors.deepOrangeAccent, size: 12,),
                      GestureDetector(
                          onTap: (){
                            //Navigation Route
                          },
                          child: GestureDetector(onTap: ()=>Get.to(const SignInPage()),child: SmallText(text: "?SignIn", color: Colors.purple, size: 12,)))
                    ],
                  ),
                )
              ],
            ),
          )
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
