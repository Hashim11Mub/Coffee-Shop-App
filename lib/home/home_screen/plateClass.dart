// ignore: file_names
import 'package:flutter/material.dart';

class plateClass extends StatelessWidget {
  const plateClass({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 220),
          child: Column(
            children: [

              Image.asset('assets/img/plate.jpg',),
            ],
          ),
    );
  
  }
}