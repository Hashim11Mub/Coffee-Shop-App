import 'package:flutter/material.dart';
import 'package:hashim_shop/home/home_screen/colors.dart';
import 'package:hashim_shop/home/home_screen/food_page_body.dart';
import 'package:hashim_shop/home/home_screen/plateClass.dart';
import 'package:hashim_shop/widgets/Big_text.dart';
import 'package:hashim_shop/widgets/small_text.dart';


class MainFoodPageState extends StatefulWidget {
  const MainFoodPageState({ Key? key }) : super(key: key);

  @override
  State<MainFoodPageState> createState() => MainFoodPageStateState();
}

class MainFoodPageStateState extends State<MainFoodPageState> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15,left: 10,right: 10),
            child: BigText(text:'Hashim Coffee Shop',color: Colors.brown),
          ),
        const FoodPageBody(),
        // Container(
        //   height: 104,
        //   margin: const EdgeInsets.only(top: 40),
        //   child: Column(
        //     children: [
        //       const Text('Drag Your Favorite Coffee!!',style: TextStyle(
        //         fontSize: 12,color: Colors.black
        //       ),),
        //       Image.asset('assets/img/ar.jpg',height: 80,),
        //     ],
        //   ),
        // ),
        // Container(
        //   height: 200,
        //   margin: const EdgeInsets.only(top: 5),
        //   child: Column(
        //     children: [
        //   Image.asset('assets/img/HA.jpg',width: 250,fit: BoxFit.cover,),
        //     ],
        // ),
        // ),
        ]
        
            ),
            
          );
  }
}
