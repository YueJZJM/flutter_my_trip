import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).pushNamed('refreshdemo');
          },
          child: Text("data"),
        ),
      ),
    );
  }
}