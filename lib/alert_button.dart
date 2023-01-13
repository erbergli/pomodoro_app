import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetButton extends StatelessWidget {
  VoidCallback setTimer;

  SetButton({super.key, required this.setTimer});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: setTimer,
      color: Colors.red,
      child: Icon(Icons.check_rounded, color: Colors.white,),
    );
  }
}
