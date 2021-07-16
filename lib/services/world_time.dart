import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location = ''; // location for the UI

  String time = ''; // the time in that location

  String flag = ''; //url for assets file icon

  String url = ''; // location url for api endpoint

  bool isDaytime=true; //true or false day or night

  WorldTime({this.location = '', this.flag = '', this.url = ''});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      //print(data);

      //get properties from data
      String datetime = data['datetime'];

      String offset1 = data['utc_offset'].substring(0, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      //set the time property

      isDaytime = now.hour >= 6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');

      time = 'could not get time data';
    }
  }
}
