import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prophetic_prayers_for_children/src/pages/prayerList.dart';

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
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Column(
          children: [
            //header
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.list, color: Colors.deepOrangeAccent,),
                  BigText(text: "Prayers For Today", size: 30, color: Colors.deepOrangeAccent,),
                  Icon(Icons.share, color: Colors.deepOrangeAccent,)
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



// appBar: AppBar(
// leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {  },),
// title: BigText(text: "Day 1", color: Colors.white, size: 20,),
// centerTitle: true,
// backgroundColor: Colors.blue,
// elevation: 0,
// actions: <Widget>[
// IconButton(onPressed: (){}, icon: Icon(Icons.alarm)),
// IconButton(onPressed: (){}, icon: Icon(Icons.search))
// ],
// ),
// body: Container(
// height: double.maxFinite,
// width: double.maxFinite,
// child: ListView.separated(
// scrollDirection: Axis.vertical,
// addAutomaticKeepAlives: false,
// itemCount: 20,
// itemBuilder: (_, index) {
// return Container(
// margin: EdgeInsets.only(left: 20, right: 20),
// height: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.blue,
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// Colors.lightBlue,
// Colors.blueAccent,
// Colors.blue
// ],
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.8),
// blurRadius: 1,
// spreadRadius: 1,
// offset: Offset(0, 3)
// )
// ]
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// CircleAvatar(child: Icon(Icons.date_range_outlined), backgroundColor: Colors.grey.withOpacity(0.5),),
// BigText(text: "Daily Prayer", color: Colors.white,),
// Icon(Icons.share, color: Colors.white,)
// ],
// ),
// );
// }, separatorBuilder: (BuildContext context, int index) {
// return SizedBox(height: 20,);
// },),
// ),

