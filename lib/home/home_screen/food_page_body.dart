
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:hashim_shop/home/home_screen/colors.dart';
import 'package:hashim_shop/home/home_screen/plateClass.dart';
import 'package:hashim_shop/widgets/Big_text.dart';
import 'package:hashim_shop/widgets/icon_and_text_widget.dart';
import 'package:flutter/services.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.6);

var imgList = [
    'assets/img/l.png',
    'assets/img/s.png',
    'assets/img/90.png',
    'assets/img/C.png',
  ];
  var text = [ 
    'Americano','Spanish','Latte','Cappucino'
  ];

  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;
  final index =0;
   bool accepted = false;
   bool active = false;
  int _counter =0;
  List<Color> _colors =[
    Color(0xFFC41A3B),
    Color(0xFF181F32),
    Color(0xFFBE0E0),
  ];
  Color _currentColor =Color(0xFF181F32);
  Color _newColor = Color(0xFF181F32);
  @override
  void initState() {
    super.initState();
    pageController.addListener(() { 
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 260,
          child: PageView.builder(
            itemBuilder: (context, index) => _buildPageItem(index),
              itemCount: 4,
              controller: pageController,
          ),
        ),
        Container(
          height: 104,
          margin: const EdgeInsets.only(top: 40),
          child: Column(
                children: [
                  const Text('Drag Your Favorite Coffee!!',style: TextStyle(
                    fontSize: 12,color: Colors.black
                  ),),
                  Image.asset('assets/img/ar.jpg',height: 80,),
                ],
          ),
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Center(
                  child: Expanded(
                    child: DragTarget<String>(
                    
                      builder: (context,  candidateData, rejectedData) {
                        return  Container(
                          
                        height: 200,
                        color: Colors.white,
                        padding: const EdgeInsets.all(5),
                        
                        margin: const EdgeInsets.only(bottom: 5),
                        child: active ==''? null :
                          Image.asset('assets/img/HA.jpg',width: 300,fit: BoxFit.cover,scale: 0.1,),
                          
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if(active==true){
                             Image.asset('assets/img/HA.jpg',width: 200);
                             imageCache?.clear();
                             text.clear();

                             
                          }
                          accepted = true;
                          active = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Center(
          child: ElegantNumberButton(
  initialValue: 0,
  minValue: 0,
  maxValue: 10,
  step: 0.5,
  decimalPlaces: 1,
  onChanged: (value) { // get the latest value from here
    
    setState(() {
      if(active ==true){
        _currPageValue++;
      }
      _currPageValue = 0;
    });
  },
buttonSizeWidth: 20,
buttonSizeHeight: 20,
),
        )
        
      ],
    );
  }
  Widget _buildPageItem(int index){
    
    Matrix4 matrix4 = Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{ 
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        overflow: Overflow.clip,
        children: [
       
          Draggable(child: Container(  
        height: 220,
        margin: const EdgeInsets.only(left: 10,right: 10),
        padding: const EdgeInsets.only(left: 10,right: 10),
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          image: DecorationImage(
            //fit: BoxFit.cover,
            //scale: 0.1,
            image: 
            AssetImage(imgList[index % 4]),
            ),
        ),
      ),
       feedback: Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
        padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: [
             Image.asset(imgList[index % 4],height: 220,),
            ],
          ),
        ),
        childWhenDragging: Container(),

        onDragCompleted: (){
                  if(_counter > 3){
                    _counter++;
                  }
                  else{
                    _counter=0;
                  }
                  setState(() {
                    _newColor = _colors[_counter];
                  });
                },
      ),
          
      Align(
             alignment: Alignment.bottomCenter,
             child: Container(  
              height: 60,
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                ),
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Text(text[index % 4],style: const TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
                ),
                
        ],
        
    ),
    
  );
  }
  
  Widget m(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable(
          // Data is the value this Draggable stores.
          feedback: Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
        padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: [
             Image.asset(imgList[index % 4],height: 220,),
            ],
          ),
        ),
          childWhenDragging: Container(),
          child: Container(  
        height: 220,
        margin: const EdgeInsets.only(left: 10,right: 10),
        padding: const EdgeInsets.only(left: 10,right: 10),
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          image: DecorationImage(
            //fit: BoxFit.cover,
            //scale: 0.1,
            image: 
            AssetImage(imgList[index % 4]),
            ),
        ),
      ),
        ),
        
      ],
    );
  }
}





