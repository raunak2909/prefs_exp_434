import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  String name = "";

  getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context){

    ///get Name from Prefs
    getName();


    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          name!="" ? Text("Welcome, $name") : Container(),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21)
              )
            ),
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: () async {
            ///save name in prefs
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("name", nameController.text);
          }, child: Text('Save'))
        ],
      ),
    );
  }
}
