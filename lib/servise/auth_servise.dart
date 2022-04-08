import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';

import '../pages/sign_in_page.dart';

class AuthServise{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future <User?> signUpUser(String name, String email, String password)async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      print(user.toString());
      return user;
    }on FirebaseException catch(e){
      if(e.code == 'weak-password'){
        print('the password provided is too weak');
      }else if(e.code == 'email-already-in-use'){
        print('the account already exists for that email.');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  static Future <User?> signInUser( String email, String password)async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      print(user.toString());
      return user;
    }on FirebaseException catch(e){
      if(e.code == 'user-not-found'){
        print('No user found that email');
      }else if(e.code == 'wrong-password'){
        print('wrong password');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  static void signOutUser(BuildContext context)async{
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }
}