import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  Color color;
  double size;
  String iconName;
  
IconFont({required this.color,required this.iconName,required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(this.iconName,
    style: TextStyle(
      color: Colors.white,
      fontSize: 100,
      fontFamily: 'hesho'
    ),
    );
  }
}