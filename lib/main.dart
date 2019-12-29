import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:async';
import 'mainRecording/recorderPage.dart';

void main(){
  runApp(new MaterialApp(
    title: "Sounds",
    home: recorderPage(),
    debugShowCheckedModeBanner: false,
  ));
}