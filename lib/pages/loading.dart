import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';
import 'package:worldtimeapp/services/world_time.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue[900],
      body: Center(

        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
          ),


      ),
    );
  }
}
