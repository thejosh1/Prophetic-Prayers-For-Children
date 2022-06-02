import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayer_detail.dart';
import 'package:prophetic_prayers_for_children/src/pages/saved_reminders.dart';
import 'package:prophetic_prayers_for_children/src/pages/set_reminders.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/big_text.dart';

class PrayerList extends StatefulWidget {
  const PrayerList({Key? key}) : super(key: key);

  @override
  State<PrayerList> createState() => _PrayerListState();
}

class _PrayerListState extends State<PrayerList> {

  final PageController _pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 230;

  @override
  void initState(){
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
        print(_currPageValue);
      });
    });
  }

  @override
  void dispose () {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          /*
          * Todo
          *  This page is dynamic it displays the scripture based on the current date
          * the previous date and the next date
          *
          */
          height: Dimensions.height320,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildPage(index);
              }),
        ),
        SizedBox(height: Dimensions.height30,),
        //other prayers
        Center(child: BigText(text: "Prayers For the Year", color: Colors.deepOrangeAccent,),),
        SizedBox(height: Dimensions.height10,),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //this takes the list of the scripture available in the database
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=>Get.to(()=> const PrayerDetails()),
                child: Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10, top: Dimensions.height20),
                  height: Dimensions.height180,
                  width: Dimensions.width100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height30),
                      gradient: LinearGradient(colors: index.isEven?[Colors.deepOrangeAccent, Colors.orange]:[Colors.purple,Colors.purpleAccent]),//Colors.deepOrangeAccent:Colors.purple[400],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 0,
                        offset: Offset(0,3)
                      )
                    ]
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20, right:Dimensions.width20, top: Dimensions.height20, bottom: Dimensions.height10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(DateFormat.MMMd().format(DateTime.now()), style: listHeadingStyle, )
                        ),
                        Container(
                            child: Text("Prophetic Prayers For Children", style: listHeadingStyle,)
                        ),
                        SizedBox(height: Dimensions.height50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Dimensions.height20,
                              width: Dimensions.width20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.height5),
                                color: Colors.white60
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  Get.to(()=> const SetReminders());
                                },
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaY: 4.0, sigmaX: 4.0),
                                    child: Container(
                                      height: Dimensions.height50,
                                      width: Dimensions.width120,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(Dimensions.height10)
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Set Reminder", style: ListHeadingStyle,),
                                            Icon(Icons.alarm_add_rounded, color: Colors.white, size: Dimensions.width20,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            // GestureDetector(onTap: ()=>Get.to(()=>const PrayerDetails()),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         //Text("See Prayer Point For Today", style: ListHeadingStyle,),
                            //         const Icon(Icons.launch_outlined, color: Colors.white, size: 20,),
                            //       ],
                            //     )
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
  Widget _buildPage(int index) {
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor + (_currPageValue - index +1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currPageValue.floor()-1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 0);
    } return Transform(
      transform: matrix,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height8),
        child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: ()=>Get.to(const PrayerDetails()),
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage(
                          "img/lonely_man.jpg"
                        ),
                        fit: BoxFit.cover
                      )
                  ),
                ),
              ),
              Positioned(
                bottom: Dimensions.height5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height5, bottom: Dimensions.height5),
                    height: Dimensions.height100,
                    width: Dimensions.width100*2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.height20),
                        gradient: const LinearGradient(colors: [Colors.purple, Colors.purpleAccent], begin: Alignment.center, end: Alignment.bottomRight)
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          SizedBox(height: Dimensions.height30,),
                          //The title of the prayer point/verse of the scripture is supposed to be here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(onTap: ()=>Get.to(()=> const SavedReminders()),child: Icon(Icons.alarm_add, color: Colors.white, size: Dimensions.width20,)),
                              Text(DateFormat.MMMd().format(DateTime.now()), style: listHeadingStyle,),
                              GestureDetector(onTap: ()=>Get.to(const PrayerDetails()),child: Icon(Icons.launch_outlined, color: Colors.white, size: Dimensions.width20,))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
