import 'package:flutter/material.dart';

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
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 250,
                  child: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: 20,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 200),
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
                  margin: EdgeInsets.only(bottom: 200),
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
                          child: SmallText(text: "?SignUp", color: Colors.purple, size: 12,))
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
