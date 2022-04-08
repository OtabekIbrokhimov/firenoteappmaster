import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class Hive_DB{
  static String DB_NAME = "NoteServises";
  static var box = Hive.box(DB_NAME);
static Future <void> storeUser (String user_id) async{
box.put("user_id", user_id);

}
static User loadUser(){
var user = box.get('user_id');
return user;
}
static void removeUser()async{
box.delete('user_id');
}
}