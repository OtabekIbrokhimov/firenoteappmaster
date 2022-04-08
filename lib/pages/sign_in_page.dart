import 'package:firebase_auth/firebase_auth.dart';
import 'package:firenoteappmaster/pages/sign_up_page.dart';

import 'package:flutter/material.dart';

import '../servise/auth_servise.dart';
import '../servise/hive_servise.dart';
import 'HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String id = "/SignInPage";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordControlleer = TextEditingController();
void doSignIn()async{
  String email = _emailController.text.trim().toString();
  String password = _passwordControlleer.text.trim().toString();
  if(email.isEmpty || password.isEmpty){
     return;
  }else{
    await AuthServise.signInUser(email, password).then((value) => _getFirebaseUser(value) );
  }
}
void _getFirebaseUser(User? user)async{
  if(user != null){
    await Hive_DB.storeUser(user.uid);
    Navigator.pushReplacementNamed(context, HomePage.id);
  }else{

  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container( width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "email",
            ),
          ),
          TextField(
            controller: _passwordControlleer,
            decoration: InputDecoration(
              hintText: "password",
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {doSignIn();},
            height: 50,
            minWidth: MediaQuery.of(context).size.width - 50,
            color: Colors.blueAccent,
            child: Text("Sign in"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(height: 20,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            TextButton(onPressed: (){}, child: Text("Don't have an account",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
            TextButton(onPressed: (){Navigator.pushReplacementNamed(context, SingUpPage.id);}, child: Text("Sign up",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),)),

          ],)
        ],
      ),
      )
    ));
  }
}
