import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/break_page.dart';
import 'package:pomodoro_app/pages/history_page.dart';
import 'package:pomodoro_app/pages/info_page.dart';
import 'package:pomodoro_app/main.dart';

class MenuDrawer extends StatelessWidget {
  List pomodoros = [];

  final _style = GoogleFonts.rowdies(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 30,
  ));
  MenuDrawer({super.key, required this.pomodoros});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text("Pomodoro Timer", style: _style),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.home_filled),
                title: Text(
                  "Pomodoro",
                  style: _style,
                ),
                // Check if timer is running before doing this
                onTap: () {
                  Navigator.pop(context);
                  // does bad shit
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: ((context) => MainPage())
                  //     ), ((route) => route.isFirst)
                  // );
                },
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.snooze),
                title: Text(
                  "Break",
                  style: _style,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => BreakPage())));
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: ((context) => BreakPage())
                  //     ), ((route) => route.isFirst)
                  // );
                },
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.history_rounded),
                title: Text(
                  "History",
                  style: _style,
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: ((context) => HistoryPage(pomodoros: pomodoros,))),
                      ((route) => route.isFirst));
                },
              ),
            ),
            Divider(thickness: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text(
                  "About Pomodoro",
                  style: _style,
                ),
                onTap: () {
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: ((context) => InfoPage())),
                      ((route) => route.isFirst));
                },
              ),
            ),
            Divider(
              thickness: 2,
            ),
            
          ],
        ));
  }
}
