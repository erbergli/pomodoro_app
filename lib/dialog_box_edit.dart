import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/alert_button.dart';
import 'package:pomodoro_app/minutes.dart';
import 'package:pomodoro_app/seconds.dart';

class DialogBox extends StatelessWidget {
  int _minutes = 0;
  int _seconds = 0;
  final RoundedRectangleBorder _roundShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  VoidCallback setTimer;

  DialogBox({super.key, required this.setTimer});

  void setMinutes(int index){
    _minutes = index;
  }

  void setSeconds(int index){
    _seconds = index;
  }

  int getSeconds(){
    return _seconds;
  }

  int getMinutes(){
    return _minutes;
  }


  //TODO FIX IT
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.redAccent,
      shape: _roundShape,
      content: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red[700],
                //decoration: BoxDecoration(shape: BoxShape.circle,),
                child: Center(
                  //builder to represent minutes
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged:(value) {setMinutes(value);},
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return MyMinutes(mins: index);
                      },
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    ":",
                    style: GoogleFonts.righteous(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red[700],
                child: Center(
                  //builder to represent seconds
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged:(value) {setSeconds(value);},
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return MySeconds(secs: index);
                      },
                    ),
                  ),
                ),
              ),
            ]),
            SetButton(setTimer: setTimer)
          ],
        ),
      ),
    );
  }
}
