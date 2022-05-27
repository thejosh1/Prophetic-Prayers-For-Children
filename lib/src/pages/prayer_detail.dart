import 'package:flutter/material.dart';
import 'package:prophetic_prayers_for_children/widget/small_text.dart';

import '../../widget/big_text.dart';

class PrayerDetails extends StatelessWidget {
  const PrayerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {  },),
        title: BigText(text: "jan-01-01", color: Colors.white, size: 20,),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.alarm)),
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(child: BigText(text: "Prayer For Today", size: 30,)),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Center(child: SmallText(text: "James 1:17 Every good and perfect gift is from above, coming down from the Father of the heavenly lights, who does not change like shifting shadows.",)),
            )
          ],
        ),
      ),
    );
  }
}
