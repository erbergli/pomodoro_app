import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _style = GoogleFonts.rowdies(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 25,
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Previous Pomodoros", style: _style,)

      ),
      // body: ListView.builder(itemBuilder: (context, index) {
        
      // })
    );
  }
}
