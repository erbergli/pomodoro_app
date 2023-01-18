import 'dart:async';
import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/edit_break_dialog.dart';
import 'package:pomodoro_app/widgets/break_tile.dart';
import 'package:pomodoro_app/widgets/pomodoro_tile.dart';

class BreakPage extends StatefulWidget {
  BreakPage({super.key});

  @override
  State<BreakPage> createState() => _BreakPageState();
}

class _BreakPageState extends State<BreakPage> {
  RoundedRectangleBorder _roundedShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
  Timer _timer = Timer(Duration(seconds: 1), () {});
  int _timeLeftMinutes = 5;
  int _timeLeftSeconds = 0;

  List breakMinutes =  [];

  BreakEditDialog _dialogBox = BreakEditDialog(
    setTimer: () {},
  );

  // add buttons so that you can start timer manually if wanted
  _BreakPageState() {
    _startTimer();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _startTimer() {
    if (!_timer.isActive && mounted == true) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_timeLeftSeconds > 0) {
          setState(() {
            _timeLeftSeconds--;
          });
        } else {
          setState(() {
            _timeLeftSeconds = 59;
            _timeLeftMinutes--;
          });
        }
        if (_timesUp()) {
          final player = AudioCache();
          player.play("audio/alarm.mp3");
          _cancelBreak();
          breakMinutes.add(_dialogBox.getMins());
        }
      });
    }
  }

  void _stopTimer() {
    _timer.cancel();
  }

  bool _timesUp() {
    return (_timeLeftMinutes == 0 && _timeLeftSeconds == 0);
  }

  void _cancelBreak() {
    _timer.cancel();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _setTimer() {
    Navigator.of(context).pop();
    setState(() {
      _timeLeftMinutes = _dialogBox.getMins();
      _timeLeftSeconds = 0;
    });
  }

  void _editBreak() {
    if (!_timer.isActive) {
      _dialogBox = BreakEditDialog(
        setTimer: _setTimer,
      );
      showDialog(
        context: context,
        builder: ((context) {
          return _dialogBox;
        }),
      );
    }
  }

  // void _cancel() {
  //   if(_timeLeftSeconds == 0 && _timeLeftMinutes == 0){
  //     Navigator.of(context).pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(166, 40, 61, 248),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            _cancelBreak();
          },
        ),
        centerTitle: true,
        title: Text(
          "Pomodoro Timer",
          style: GoogleFonts.rowdies(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 40, 61, 248),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                  "${_timeLeftMinutes.toString().padLeft(2, '0')}:${_timeLeftSeconds.toString().padLeft(2, '0')}",
                  style: GoogleFonts.rowdies(
                    textStyle:
                        const TextStyle(fontSize: 100, color: Colors.white),
                  )),
              Text("Great job! Let's take a quick break!",
                  style: GoogleFonts.rowdies(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Start button
                  MaterialButton(
                    onPressed: _startTimer,
                    color: Color.fromARGB(255, 40, 61, 248),
                    shape: _roundedShape,
                    child: Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  //stop button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: _stopTimer,
                      color: Color.fromARGB(255, 40, 61, 248),
                      shape: _roundedShape,
                      child: Icon(
                        Icons.stop_circle_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // cancel button
                  MaterialButton(
                    onPressed: _cancelBreak,
                    color: Color.fromARGB(255, 40, 61, 248),
                    shape: _roundedShape,
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: _editBreak,
                      minWidth: 30,
                      color: Color.fromARGB(255, 40, 61, 248),
                      shape: _roundedShape,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
