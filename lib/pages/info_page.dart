import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/menu_drawer.dart';

class InfoPage extends StatelessWidget {
  final _style = GoogleFonts.rowdies(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 25,
  ));

  final _style2 = GoogleFonts.rowdies(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 20,
  ));
  InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "About Pomodoro",
          style: _style,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            //Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Step 1: Pick a task that you want to complete",
              style: _style2,
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Step 2: Start the the pomodoro timer",
              style: _style2,
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Step 3: Stay focused during that period of time",
              style: _style2,
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Step 4: When the time is up, take a short break (around 5 minutes).",
              style: _style2,
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Step 5: If you want to you can take a longer 15-30 minutes break every four pomodoros.",
              style: _style2,
            ),
          ),
          Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
