import 'dart:async';

import 'package:get/get.dart';

import 'coin_controller.dart';

class TimeProvider   extends   CoinController{
  Timer? timer;

  RxInt currentTime = 0.obs;

  TimeProvider({
    required this.totalTime,
  }) {}

  startMethod(int seconds) {
    if (timer != null) {
      timer!.cancel();
    }
    var oneSec = Duration(seconds: 1);
    currentTime(seconds);

    timer = new Timer.periodic(oneSec, (Timer timer) {
      if (currentTime <= 1) {
        timer.cancel();
        currentTime(0);
        timerStatus = TimerStatus.pause;
        timeOver();
        update();
      } else {
        currentTime = currentTime - 1;
        print("gdfd==true");
        update();
      }
    });
  }


  timeOver(){

  }

  final int totalTime;

  TimerStatus timerStatus = TimerStatus.restart;

  void startTimer() {
    startMethod(totalTime);
    timerStatus = TimerStatus.play;
  }

  void pauseTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    timerStatus = TimerStatus.pause;
  }

  void cancelTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  void resumeTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    startMethod(currentTime.value);
    timerStatus = TimerStatus.play;
  }

  void reset() {
    startMethod(totalTime);
  }

  void restartTimer() {
    startMethod(totalTime);
    timerStatus = TimerStatus.play;
  }

  @override
  void dispose() {

    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}

enum TimerStatus {
  restart,
  play,
  pause,
}
