import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pomodoro_app/start_button.dart';
import 'package:pomodoro_app/stop_button.dart';

class MainButtons extends StatelessWidget {
  VoidCallback startTimer;
  VoidCallback stopTimer;
  VoidCallback resetTimer;
  VoidCallback editTimer;
  RoundedRectangleBorder _roundedShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
  StartButton _startButton = StartButton(shape: 0, startTimer: () {});
  StopButton _stopButton = StopButton(shape: 0, stopTimer: () {});

  MainButtons({
    super.key,
    required this.startTimer,
    required this.stopTimer,
    required this.resetTimer,
    required this.editTimer,
  });

  StartButton getStartButton() {
    return _startButton;
  }

  StopButton getStopButton() {
    return _stopButton;
  }

  @override
  Widget build(BuildContext context) {
    _startButton = StartButton(
          shape: _roundedShape,
          startTimer: startTimer,
        );

    _stopButton = StopButton(
          shape: _roundedShape,
          stopTimer: stopTimer);
    
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: _startButton,
        ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: _stopButton,
          ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
              onPressed: resetTimer,
              shape: _roundedShape,
              color: Colors.red,
              child: const Icon(
                Icons.settings_backup_restore_sharp,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: editTimer,
            shape: _roundedShape,
            color: Colors.red,
            minWidth: 20,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
