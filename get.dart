import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nic = '';
  String passport = '';
  String name = '';
  String sex = '';
  String height = '';
  

  TextEditingController user = TextEditingController();
  String url = ' your api url ';

  getData(String username) async{
    String profile = url+username;
    var res = await http.get(Uri.parse(profile));
    var resBody = json.decode(res.body.toString());
    name = resBody['name'];

    setState(() {
      print("Success");
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              TextField(
                controller: user,
                decoration: const InputDecoration(hintText: "Enter Github Uername"),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              TextButton(
                  onPressed: ()=>getData(user.text),
                  child: const Text("Get Info")
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            //  Text("ID : $id",style: const TextStyle(fontSize: 20.0),),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Text("Name : $name",style: const TextStyle(fontSize: 22.0),),
              const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            //  Text("Public repo : $public_repos",style: const TextStyle(fontSize: 20.0),),
            ],
          ),
        ),
      ),
    );
  }
}
