import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/break_page.dart';
import 'package:pomodoro_app/pages/dialog_box_edit.dart';
import 'package:pomodoro_app/buttons/mainButtons.dart';
import 'package:pomodoro_app/pages/main_page.dart';
import 'package:pomodoro_app/pages/menu_drawer.dart';
import 'package:wakelock/wakelock.dart';


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
    Wakelock.enable();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}
