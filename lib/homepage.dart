import 'package:alwafaa_task/addresseditpage.dart';
import 'package:alwafaa_task/addresspage2.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Address',style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),
      body: Center(
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.pink,onPrimary: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddrPage()));
            },
            child: Text('Add Address'),

          ),
        ),
      ),
      
    );
  }
}

