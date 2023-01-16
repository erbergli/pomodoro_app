import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MySeconds extends StatelessWidget {
  int secs;

  MySeconds({super.key, required this.secs});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        secs.toString().padLeft(2, '0'),
        style: GoogleFonts.righteous(textStyle: TextStyle(color: Colors.white,fontSize: 30)),
      ),
    );
  }
}