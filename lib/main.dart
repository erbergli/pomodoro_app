import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/break_page.dart';
import 'package:pomodoro_app/dialog_box_edit.dart';
import 'package:pomodoro_app/mainButtons.dart';
import 'package:pomodoro_app/menu_drawer.dart';

void main() {
  // sets the preferred orientation as to not be able to enter landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Timer _timer = Timer(Duration(), (() {}));
  DialogBox _dialogBox = DialogBox(setTimer: (() {}));
  int _timeLeftSeconds = 0;
  int _timeLeftMinutes = 25;
  final String _initialText = "Start a new Pomodoro!";
  String _promptText = "Start a new Pomodoro!";

  // To start the timer
  void _startPomodoroTimer() {
    if (!_timer.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (_timeLeftSeconds > 0) {
            setState(() {
              _timeLeftSeconds--;
            });
          }else{
            setState(() {
              _timeLeftSeconds = 59;
              _timeLeftMinutes--;
            });
          }
        
        
          if (_timeLeftMinutes == 0 && _timeLeftSeconds == 0) {
            final player = AudioCache();
            player.play("audio/alarm.mp3");
            setState(() {
              _timer.cancel();
              _timeLeftMinutes = 25;
              _timeLeftSeconds = 0;
            });
            _takeBreak();
          }
        
      });
    }
  }

@override
  void setState(VoidCallback fn) {
    
    if(mounted){  
      super.setState(fn);
    }
    
  }

  // Create a new page with different mood which will only contain the break time and functionality.
  void _takeBreak() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return BreakPage();
    }));
  }

  // To stop the timer
  void _stopTimer() {
    _timer.cancel();
  }

  // To reset timer
  void _resetTimer() {
    _stopTimer();
    setState(() {
      _promptText = _initialText;
      _timeLeftSeconds = 0;
      _timeLeftMinutes = 25;
    });
  }

  // sets the timer
  void _setTimer() {
    setState(() {
      _timeLeftMinutes = _dialogBox.getMinutes();
      _timeLeftSeconds = _dialogBox.getSeconds();
    });
    Navigator.of(context).pop();
  }

  // TODO edit the timer
  void _editTimer() {
    if (!_timer.isActive) {
      _dialogBox = DialogBox(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pomodoro Timer",
          style: GoogleFonts.rowdies(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: MenuDrawer(),
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
              MainButtons(
                startTimer: _startPomodoroTimer,
                stopTimer: _stopTimer,
                resetTimer: _resetTimer,
                editTimer: _editTimer,
              ),
              Text(_promptText,
                  style: GoogleFonts.rowdies(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
