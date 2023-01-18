import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/main_page.dart';
import 'package:pomodoro_app/widgets/pomodoro_tile.dart';

class HistoryPage extends StatefulWidget {
  List pomodoros = [];
  HistoryPage({super.key, required this.pomodoros});

  @override
  State<HistoryPage> createState() => _HistoryPageState(pomodoros: pomodoros);
}

class _HistoryPageState extends State<HistoryPage> {
  MainPage mp = MainPage();
  List pomodoros = [];

  _HistoryPageState({required this.pomodoros});

  final _style = GoogleFonts.rowdies(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 25,
  ));

  void _deletePomdodoro(int index){
    if(!pomodoros.isEmpty){
      setState(() {
        pomodoros.removeAt(index);
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Previous Pomodoros", style: _style,)

      ),
      body: ListView.builder(
        itemCount: pomodoros.length,
        itemBuilder: (context, index) {
          
          return PomodoroTile(
            minutes: pomodoros[index],
            deletePomodoro: (value) => _deletePomdodoro(index),
            index: index,
          );
      })
    );
  }
}
