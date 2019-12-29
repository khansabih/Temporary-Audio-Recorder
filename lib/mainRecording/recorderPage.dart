import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
//import 'package:audio_recorder/audio_recorder.dart';
//import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

class recorderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new recorderPageState();
  }

}

class recorderPageState extends State<recorderPage>{

  String fetchPath;
  FlutterSound flutterSound;

  bool hasPermission;
  var recorder;


  void initializePermissions()async{
    flutterSound = new FlutterSound();
  }
  @override
  void initState() {
    // TODO: implement initState
    initializePermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //To start the recording
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.mic,color: Colors.white,),
                  onPressed: () async{
                    fetchPath = await flutterSound.startRecorder(null);
//                    print('startRecorder: $path');
//
//                    _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
//                      DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
//                      String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
//                    });
                  },
                ),

                //To stop the recording
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.stop,color: Colors.white,),
                  onPressed: () async{
                    String result = await flutterSound.stopRecorder();
                    print('stopRecorder: $result');
//                    initState();
//                    File file = File('${result.path}/myRec');
                  },
                ),

                //To play the recording
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.play_arrow,color: Colors.white,),
                  onPressed: () async{
                    await flutterSound.startPlayer(fetchPath);
                  },
                ),

                //To stop playing
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.cancel),
                  onPressed: ()async{
                    String result = await flutterSound.stopPlayer();
                    print('stopPlayer: $result');
                  },
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}