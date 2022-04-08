
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String str = "HomePage";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // str = Hive_DB.box.values.first;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage(""),
                  ),
                  Text(
                    "OTABEK",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "IBROKHIMOV",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            MaterialButton(onPressed: (){},child: Text("log out",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),)
          ],
        ),
      ),

    );
  }
}
