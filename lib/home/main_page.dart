

import 'package:flutter/material.dart';
import 'package:hashim_shop/home/Login/LoginScreen.dart';
import 'package:hashim_shop/home/home_screen/main_home_screen.dart';
import 'package:hashim_shop/widgets/icondont.dart';
import 'package:hashim_shop/home/Login/SignUpScreen.dart';





class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage,required this.duration});
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration), (){ 
    Navigator.push(context, MaterialPageRoute(builder: (context) => this.goToPage)
    );
  });


    return Scaffold(
      body: Container(
        color: Colors.brown,
        alignment: Alignment.center,
        child: IconFont(
          color: Colors.white,
          iconName: 'a',
          size:100
        )
      )
    );
  }
}


class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity( 
                opacity: 0.3,
              child: Image.asset('assets/img/1.jpg',
            fit: BoxFit.cover,
              ),
              ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.brown,
                          alignment: Alignment.center,
                          child: IconFont(
                            color: Colors.white,
                            iconName: 'a',
                            size: 130,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Hashim Coffee Shop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text('All your favorite coffees.\nAll in one place.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                    ),
                    ),
                    SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                              color: Colors.brown,
                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);},
                               child: Text('Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
                        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                        child: TextButton(onPressed: (){Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) {
                        return SignUpScreen();},));},
                          child: Text('Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.brown,
                            width: 4,
                            
                          
                            
                          ),
                          
                        ),
                      )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}