import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/pages/main_page.dart';

class PomodoroTile extends StatelessWidget {
  Function(BuildContext) deletePomodoro;
  int minutes;
  int index;
  final RoundedRectangleBorder _roundShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  PomodoroTile(
      {super.key, required this.minutes, required this.deletePomodoro, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deletePomodoro,
              flex: 2,
              icon: Icons.delete_forever,
              backgroundColor: Color.fromARGB(255, 183, 28, 28),
              borderRadius: BorderRadius.circular(12),
            ),
          ]),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4)),
                    child: Center(child: Text((index + 1).toString(), style:  GoogleFonts.rowdies(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white)) ,)),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "You focused for:",
                          style: GoogleFonts.rowdies(
                              textStyle: const TextStyle(
                                  fontSize: 25, color: Colors.white)),
                        ),
                        Text(
                          "${minutes.toString()} minutes",
                          style: GoogleFonts.rowdies(
                              textStyle: const TextStyle(
                                  fontSize: 25, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white70,
                  ),
                ]),
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
