import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StopButton extends StatelessWidget {
  var shape;
  VoidCallback stopTimer;
  StopButton({super.key, required this.shape, required this.stopTimer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: stopTimer,
        shape: shape,
        color: Colors.red,
        child: const Icon(
          Icons.stop_circle_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
