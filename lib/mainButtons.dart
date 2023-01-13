import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainButtons extends StatelessWidget {
  VoidCallback startTimer;
  VoidCallback stopTimer;
  VoidCallback resetTimer;
  VoidCallback editTimer;
  RoundedRectangleBorder _roundedShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  MainButtons({
    super.key,
    required this.startTimer,
    required this.stopTimer,
    required this.resetTimer,
    required this.editTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
              onPressed: startTimer,
              shape: _roundedShape,
              color: Colors.red,
              child: const Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
              onPressed: stopTimer,
              shape: _roundedShape,
              color: Colors.red,
              child: const Icon(
                Icons.stop_circle_outlined,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
              onPressed: resetTimer,
              shape: _roundedShape,
              color: Colors.red,
              child: const Icon(
                Icons.settings_backup_restore_sharp,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: editTimer,
            shape: _roundedShape,
            color: Colors.red,
            minWidth: 20,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
