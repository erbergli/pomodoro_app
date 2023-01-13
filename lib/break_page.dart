import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakPage extends StatefulWidget {
  const BreakPage({super.key});

  @override
  State<BreakPage> createState() => _BreakPageState();
}

class _BreakPageState extends State<BreakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
