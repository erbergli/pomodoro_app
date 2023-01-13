import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMinutes extends StatelessWidget {
  int mins;

  MyMinutes({super.key, required this.mins});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        mins.toString().padLeft(2, '0'),
        style: GoogleFonts.righteous(textStyle: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
