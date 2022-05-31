import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashim_shop/home/home_screen/main_home_screen.dart';
import 'package:hashim_shop/model/user_model.dart';
import 'package:hashim_shop/widgets/icondont.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // our from key
  final _fromKey = GlobalKey<FormState>();
  // editing Contrllor
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  //firbase
  final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ('First Name Cannot Be Empty');
        }
        if(!regex.hasMatch(value)){
          return ('Please Enter Valid Nam(Min. 3 Character)');
        }
          return null;
      },
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        ),
      ),


    );

    //second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return ('Second Name Cannot Be Empty');
        }
          return null;
      },
      onSaved: (value){
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Second Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        ),
      ),


    );

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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        ),
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
          return ('Please Enter Valid Password(Min. 6 Character');
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        ),
      ),


    );

    //Confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmPasswordEditingController.text.length > 6 && passwordEditingController.text != value){
          return 'Password dont match';
        }
          return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        ),
      ),


    );
    
    //signup button
    final SignUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.brown,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text('SignUp',textAlign: TextAlign.center,style: TextStyle(
          fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold
        ),),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.brown),
        onPressed: (){
          //passing this to the pop
          Navigator.of(context).pop();
        },),
      ),
      body: Center(child: 
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(padding: const EdgeInsets.all(36),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
        )))
      ),
                
                SizedBox(height: 20),
                firstNameField,
                SizedBox(height: 20),
                secondNameField,
                SizedBox(height: 20),
                emailField,
                SizedBox(height: 20),
                passwordField,
                SizedBox(height: 20),
                confirmPasswordField,
                SizedBox(height: 20),
                SignUpButton,
                SizedBox(height: 15),

              ],
            ),
           ),
          ), 
        ),
       ),
      ),
    );
  }
  void signUp(String email, String password) async
  {
    if(_fromKey.currentState!.validate()){
      await _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {postDetailsToFirestore()})
      .catchError((e) {
    Fluttertoast.showToast(msg: e!.message);
      });
    }
  }


  postDetailsToFirestore() async{
    //Calling our firestore
    //Calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;


    await firebaseFirestore
    .collection('users')
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account created successfully :)');

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => main_home_screen()), (route) => false);
  }
}
