import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prophetic_prayers_for_children/src/pages/auth/sign_up_page.dart';

import '../../../widget/big_text.dart';
import '../../../widget/small_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  margin: EdgeInsets.only(bottom: 20),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                        child: BigText(text: "Sign In With Email", color: Colors.white,)),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
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
                        child: BigText(text: "Sign In With Google", color: Colors.white,)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(text: "Powered by the army of david ministries", color: Colors.deepOrangeAccent, size: 12,),
                      GestureDetector(
                          onTap: (){
                            //Navigation Route
                          },
                          child: GestureDetector(onTap: ()=>Get.to(SignUpPage()),child: SmallText(text: "?SignUp", color: Colors.purple, size: 12,)))
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
