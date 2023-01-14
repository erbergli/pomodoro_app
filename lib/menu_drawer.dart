import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/break_page.dart';
import 'package:pomodoro_app/main.dart';

class MenuDrawer extends StatelessWidget {
  final _style = GoogleFonts.rowdies(textStyle: TextStyle(color: Colors.white, fontSize: 30,));
  MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "Pomodoro Timer",
                style: _style
                ),
              ),
            ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Pomodoro", style: _style,),
            // Check if timer is running before doing this
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MainPage())));
            },
          ),
          ListTile(
            leading: Icon(Icons.snooze),
            title: Text("Break", style: _style,),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => BreakPage())));
            },
          ),
          ],
          )
      );
  }
}
