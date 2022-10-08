import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../app/pref_data.dart';

class AudioPlayer{

  BuildContext? context;

  AudioCache audioCache = new AudioCache();

  bool? _isSound = true;
  bool? _isVibrate = true;

  String tickSound = 'tick.mp3';
  String rightSound = 'right.mp3';
  String wrongSound = 'wrong.mp3';


  AudioPlayer(BuildContext context){
    this.context = context;
    setSound();
  }


  setSound()async{
    _isSound = await getSound();
    _isVibrate = await getVibration();
  }

  void playWrongSound(){
    playAudio(wrongSound);
    if(_isVibrate!) {
      Vibrate.vibrate();
    }
  }




  void playRightSound(){

      playAudio(rightSound);
  }
  void playTickSound(){
    playAudio(tickSound);
  }


  void playAudio(String s) async {
    if (_isSound!) {
      try{
        await audioCache.play(s);
      }on Exception  catch(_) {

      }
    }
  }


  void stopAudio() async {
    if (_isSound!) {
      await audioCache.clearAll();
    }
  }


}