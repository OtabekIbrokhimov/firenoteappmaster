import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import '../servise/auth_servise.dart';
import '../servise/hive_servise.dart';
import 'sign_in_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);
static const String id = "/SignUpPage";
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void  _doSingUp() async{
    String firstName = firstNameController.text.trim().toString();
    String lastName = lastNameController.text.trim().toString();
    String email = emailController.text.trim().toString();
    String password = passwordController.text.trim().toString();
    if(email.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty) {
      print("empty");
      return;
    }
await AuthServise.signUpUser(firstName+" "+lastName, email, password).then((value) =>
    _getFirebaseUser(value));
 }
void _getFirebaseUser(User? user)async{
    if(user != null){
      await Hive_DB.storeUser(user.uid);
      Navigator.pushReplacementNamed(context, SignInPage.id);
    }
    else{
print(null);
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // #firstname
              TextField(
                textInputAction: TextInputAction.next,
                controller: firstNameController,
                decoration: InputDecoration(
                    hintText: "Firstname"
                ),
              ),
              SizedBox(height: 10,),

              // #lastname
              TextField(
                textInputAction: TextInputAction.next,
                controller: lastNameController,
                decoration: InputDecoration(
                    hintText: "Lastname"
                ),
              ),
              SizedBox(height: 10,),

              // #email
              TextField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),
              SizedBox(height: 10,),

              // #password
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 10,),

              // #sign_in
              MaterialButton(
                onPressed: _doSingUp,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 50,
                minWidth: MediaQuery.of(context).size.width - 50,
                color: Colors.blueAccent,
                child: Text("Sign Up"),
                textColor: Colors.white,
              ),
              SizedBox(height: 20,),

              // #don't_have_account
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Already have an account? ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    },
                    child: Text("Sign In", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}