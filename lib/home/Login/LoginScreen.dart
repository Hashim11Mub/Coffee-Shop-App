import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hashim_shop/home/Login/SignUpScreen.dart';
import 'package:hashim_shop/home/home_screen/main_home_screen.dart';
import '../../widgets/icondont.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {

  // our from key
  final _fromKey = GlobalKey<FormState>();
  // editing Contrllor
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  
  //firbase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty)
        {
          return ('Please Enter Your Email');
        }
        // reg expression for email validation
        if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value))
        {
          return ('Please enter a valid email');
        }
          return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18),
        ),
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        filled: true,
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return ('Password is required for login');
        }
        if(!regex.hasMatch(value)){
          return ('Please Enter Valid Password(Min. 6 Character)');
        }
      },
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18),
        ),
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        filled: true,
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.brown,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailEditingController.text, passwordEditingController.text);
        },
        child: Text('Login',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
        ),
        
        
    ));


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.brown),
        onPressed: (){
          //passing this to the pop
          Navigator.of(context).pop();
  }       )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Container(
                    child: ClipOval(
                      child: Container(
                        width: 160,
                        height: 160,
                        color: Colors.brown,
                        alignment: Alignment.center,
                        child: IconFont(
                          color: Colors.white,
                          iconName: 'a',
                          size: 80
                         ),
                        ),
                     )
                ),
                  SizedBox(height: 40),
                  Text('Enter your credential to login',style: TextStyle(color: Colors.black),),
                  SizedBox(height: 40),
                  emailField,
                  SizedBox(height: 15),
                  passwordField,
                  SizedBox(height: 15),
                  loginButton,
                  SizedBox(height: 35),
                  TextButton(onPressed: (){}, child: Text('Forgot password?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Don't have an account?",),
                    TextButton(onPressed: (){Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) {
                    return SignUpScreen();},));},
                    child: Text('Sign up',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
               ],
              )
                ],
              ),),
            ),
          ),
        )
      ),
      
    );
  }
  // login function
void signIn(String email, String password) async {
  if(_fromKey.currentState!.validate()) {
    await _auth.signInWithEmailAndPassword(email: email, password: password)
    .then((uid) => {
      Fluttertoast.showToast(msg:'Login Successful'),
      Navigator.of(context).pushAndRemoveUntil( 
         MaterialPageRoute(builder: (context) => main_home_screen()),(route) => false),
    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
}