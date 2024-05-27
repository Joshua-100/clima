import 'dart:ffi';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(
        "The Latitude is : ${location.latitude} & The Longitude is : ${location.longitude}");

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var myData = await networkHelper.getData();
    // print(myData);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen()));

    var temp = myData['main']['temp'];
    var name = myData['name'];
    var condition = myData['weather'][0]['id'];
    print(condition);
    print(temp);
    print(name);
  }

  void getWeatherData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=0fdce3e266e20eaabbfbcb73e0107e4f'));
    var myDataFormatted = jsonDecode(response.body);
    var temp = myDataFormatted['main']['temp'];
    var name = myDataFormatted['name'];
    var condition = myDataFormatted['weather'][0]['id'];
    print(condition);
    print(temp);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LocationScreen()));
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
