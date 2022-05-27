import 'package:flutter/material.dart';
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
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven?Colors.deepOrangeAccent:Colors.purple[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      spreadRadius: 0,
                      offset: Offset(0,3)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: BigText(text: "Prayer For Today", color: Colors.white,)
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: BigText(text: "01-02-04", color: Colors.white,)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.access_alarm, color: Colors.white, size: 20,),
                        Icon(Icons.share, color: Colors.white, size: 20,),
                        Icon(Icons.launch_outlined, color: Colors.white, size: 20,)
                      ],
                    )
                  ],
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
              Container(
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
                        color: Colors.purple[400]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: "01-01-01", color: Colors.white,),
                        const SizedBox(height: 10,),
                        BigText(text: "Prayer For Today", color: Colors.white,),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.alarm_add, color: Colors.white, size: 20,),
                            Icon(Icons.share, color: Colors.white, size: 20,),
                            Icon(Icons.favorite_outline, color: Colors.white, size: 20,)
                          ],
                        )
                      ],
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
