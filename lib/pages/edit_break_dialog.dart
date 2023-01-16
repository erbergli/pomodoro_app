import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakEditDialog extends StatelessWidget {
  int _mins = 0;
  VoidCallback setTimer;
  final RoundedRectangleBorder _roundShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  BreakEditDialog({super.key, required this.setTimer});

  void _setMins(int mins) {
    _mins = mins;
  }

  int getMins(){
    return _mins;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      backgroundColor: Colors.blue[900],
      shape: _roundShape,
      content: Container(
        color: Color.fromARGB(255, 33, 100, 243),
        height: 150,
        width: 200,
        child: Column(
          children: [
            SizedBox(height: 3,),
            MaterialButton(
              color: const Color.fromARGB(255, 40, 61, 248),
              shape: _roundShape,
              onPressed: (() {
                _setMins(5);
                setTimer();
              }),
              child: Text(
                "5 min",
                style: GoogleFonts.rowdies(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
              ),
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 40, 61, 248),
              shape: _roundShape,
              onPressed: (() {
                _setMins(15);
                setTimer();
              }),
              child: Text(
                "15 min",
                style: GoogleFonts.rowdies(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
              ),
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 40, 61, 248),
              shape: _roundShape,
              onPressed: (() {
                _setMins(30);
                setTimer();
              }),
              child: Text(
                "30 min",
                style: GoogleFonts.rowdies(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
