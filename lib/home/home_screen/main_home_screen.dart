
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashim_shop/home/Login/LoginScreen.dart';
import 'package:hashim_shop/model/user_model.dart';
import 'package:hashim_shop/widgets/icondont.dart';
import 'package:hashim_shop/home/home_screen/MainFoodPage.dart';

class main_home_screen extends StatefulWidget {
  const main_home_screen({ Key? key }) : super(key: key);

  @override
  State<main_home_screen> createState() => _main_home_screenState();
}

class _main_home_screenState extends State<main_home_screen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
    .collection('users')
    .doc(user!.uid)
    .get()
    .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    setState(() {} );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),centerTitle: true,
        ),
        body: Center(
          child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Container(
                   child: ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.brown,
                    alignment: Alignment.center,
                    child: IconFont(
                      color: Colors.white,
                      iconName: 'a',
                      size: 150
        ),
        ),
        ),
      ),
              ),
              Text('Welcome Back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500),
                ),
                Text("${loggedInUser.email}",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(height: 15,),
                ActionChip(label: Text('Logout'),onPressed: (){
                  logout(context);
                },),
                SizedBox(height: 15,),
                ActionChip(label: Text('Start'),onPressed: (){
                  Navigator.of(context).
                    pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainFoodPageState()),(route) => false);
                }),
            ],
          ),
          ),
          
        ),
      
    );
  }
  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}