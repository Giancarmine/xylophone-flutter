import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playSound(int sound) {
    player.play('note$sound.wav');
  }

  Expanded buildKey({int sound, Color color, String note}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(sound);
        },
        child: Text(
          note,
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(sound: 1, color: Colors.red, note: 'DO'),
              buildKey(sound: 2, color: Colors.orange, note: 'RE'),
              buildKey(sound: 3, color: Colors.yellow, note: 'MI'),
              buildKey(sound: 4, color: Colors.green, note: 'FA'),
              buildKey(sound: 5, color: Colors.teal, note: 'SOL'),
              buildKey(sound: 6, color: Colors.blue, note: 'LA'),
              buildKey(sound: 7, color: Colors.purple, note: 'SI'),
            ],
          ),
        ),
      ),
    );
  }
}
