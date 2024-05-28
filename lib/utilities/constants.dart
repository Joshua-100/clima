import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const borderRadius = 12.0;

const kFieldBoxDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.black),
    fillColor: Colors.white,
    filled: true,
    icon: Icon(Icons.location_city, color: Colors.white),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0))),
    hintText: "e.g Harare",
    hintStyle: TextStyle(color: Colors.grey, fontSize: 20));
