import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  String name = "";
  int timeOpen = 0;
  SharedPreferences? prefs;

  getName() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("name") ?? "";
    getCount();
  }

  getCount() {
    timeOpen = prefs!.getInt('count') ?? 0;
    timeOpen++;
    prefs!.setInt('count', timeOpen);
    setState(() {});
  }

  ///Splash
  ///Login -> when tap on login btn then navigate to HOME
  ///Home -> ///logout -> when tap on logout btn then navigate to Login

  ///Netflix UI
  ///Expense UI
  ///Instagram UI (Figma)
  ///WhatsApp UI
  ///Wallpaper UI
  ///Notes UI
  ///BMI app
  ///List app
  ///Calculator app
  ///Tip Calculator app

  @override
  void initState() {
    super.initState();
    ///get Name from Prefs
    getName();
  }

  @override
  Widget build(BuildContext context) {

    Color bgColor = Colors.white;

    if(timeOpen%3==0 && timeOpen%5==0){
      bgColor = Colors.orange.shade200;
    } else if(timeOpen%3==0){
      bgColor = Colors.green.shade200;
    } else if(timeOpen%5==0){
      bgColor = Colors.blue.shade200;
    }


    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Stack(
        children: [
          Container(
            color: bgColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                "$timeOpen",
                style: TextStyle(fontSize: 100, color: Colors.black26),
              ),
            ),
          ),
          Column(
            children: [
              name != "" ? Text("Welcome, $name") : Container(),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
              SizedBox(height: 11),
              ElevatedButton(
                onPressed: () async {
                  ///save name in prefs
                  //SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs!.setString("name", nameController.text);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
