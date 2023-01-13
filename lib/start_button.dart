import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartButton extends StatelessWidget {
  var shape;
  VoidCallback startTimer;
  StartButton({super.key, required this.shape, required this.startTimer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: startTimer,
        shape: shape,
        color: Colors.red,
        child: const Icon(
          Icons.play_circle_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
