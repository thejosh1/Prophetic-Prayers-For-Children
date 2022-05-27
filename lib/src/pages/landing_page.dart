import 'package:flutter/material.dart';
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
                        child: BigText(text: "Get Started", color: Colors.white,)),
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
                          child: SmallText(text: "?Sign in", color: Colors.purple, size: 12,))
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
