import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayer_detail.dart';
import 'package:prophetic_prayers_for_children/src/pages/set_reminders.dart';
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
        Container(
          height: 320,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildPage(index);
              }),
        ),
        SizedBox(height: 30,),
        //other prayers
        Center(child: BigText(text: "Prayers For the Year", color: Colors.deepOrangeAccent,),),
        SizedBox(height: 10,),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=>Get.to(PrayerDetails()),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: index.isEven?[Colors.deepOrangeAccent, Colors.orange]:[Colors.purple,Colors.purpleAccent]),//Colors.deepOrangeAccent:Colors.purple[400],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 0,
                        offset: Offset(0,3)
                      )
                    ]
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: BigText(text: DateFormat.MMMd().format(DateTime.now()), color: Colors.white, size: 20,)
                        ),
                        Container(
                            child: BigText(text: "Prophetic Prayers For Children", color: Colors.white,)
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  Get.to(SetReminders());
                                },
                                child: Icon(Icons.alarm_add_rounded, color: Colors.white, size: 20,)),
                            GestureDetector(onTap: ()=>Get.to(PrayerDetails()),child: Icon(Icons.launch_outlined, color: Colors.white, size: 20,))
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
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()) {
      var _currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, _currScale, 1.0)..setTranslationRaw(0, _currTrans, 0);
    } else if(index == _currPageValue.floor()+1) {
      var _currScale = _scaleFactor + (_currPageValue - index +1) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, _currScale, 1.0)..setTranslationRaw(0, _currTrans, 0);
    } else if(index == _currPageValue.floor()-1) {
      var _currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale)/2;
      matrix = Matrix4.diagonal3Values(1.0, _currScale, 1.0)..setTranslationRaw(0, _currTrans, 0);
    } else {
      var _currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, _currScale, 1.0)..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 0);
    } return Transform(
      transform: matrix,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: ()=>Get.to(PrayerDetails()),
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(
                          "img/lonely_man.jpg"
                        ),
                        fit: BoxFit.cover
                      )
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [Colors.purple, Colors.purpleAccent], begin: Alignment.center, end: Alignment.bottomRight)
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                              ),
                              SizedBox(width: 5,),
                              BigText(text: DateFormat.MMMd().format(DateTime.now()), color: Colors.white,),
                            ],
                          ),
                           SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(onTap: ()=>Get.to(SetReminders()),child: Icon(Icons.alarm_add, color: Colors.white, size: 20,)),
                              GestureDetector(onTap: ()=>Get.to(PrayerDetails()),child: Icon(Icons.launch_outlined, color: Colors.white, size: 20,))
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
