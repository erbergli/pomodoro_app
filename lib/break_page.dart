import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakPage extends StatefulWidget {
  BreakPage({super.key});

  @override
  State<BreakPage> createState() => _BreakPageState();
}

class _BreakPageState extends State<BreakPage> {
  Timer _timer = Timer(Duration(seconds: 1), (){});
  int _timeLeftMinutes = 5;
  int _timeLeftSeconds = 0;

  void _cancelBreak() {
    _timer.cancel();
    Navigator.of(context).pop();
  }

  void _cancel() {
    if(_timeLeftSeconds == 0 && _timeLeftMinutes == 0){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(166, 40, 61, 248),
      appBar: AppBar(
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
              MaterialButton(
                onPressed: _cancelBreak,
                color: Color.fromARGB(255, 40, 61, 248),
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
