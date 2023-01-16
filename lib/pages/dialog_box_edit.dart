import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/buttons/alert_button.dart';
import 'package:pomodoro_app/widgets/minutes.dart';
import 'package:pomodoro_app/widgets/seconds.dart';

class DialogBox extends StatelessWidget {
  int _minutes = 0;
  int _seconds = 0;
  final RoundedRectangleBorder _roundShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  VoidCallback setTimer;

  DialogBox({super.key, required this.setTimer});

  void setMinutes(int index) {
    _minutes = index * 5;
  }

  // void setSeconds(int index){
  //   _seconds = index;
  // }

  // int getSeconds(){
  //   return _seconds;
  // }

  int getMinutes() {
    return _minutes;
  }

  //TODO FIX IT
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit length of session:",
          style: GoogleFonts.rowdies(
              textStyle: TextStyle(color: Colors.white, fontSize: 20))),
      backgroundColor: Colors.redAccent,
      shape: _roundShape,
      content: SizedBox(
        width: 100,
        height: 130,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Icon(Icons.arrow_upward_rounded, color: Colors.white),
                  SizedBox(height: 10,),
                  Icon(Icons.arrow_downward_rounded, color: Colors.white),
                  SizedBox(height: 10,),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red[700],
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color.fromARGB(255, 183, 28, 28)),
                // ),
                //decoration: BoxDecoration(shape: BoxShape.circle,),
                child: Center(
                  //builder to represent minutes
                  child: ListWheelScrollView.useDelegate(
                    squeeze: 1,
                    itemExtent: 45,
                    perspective: 0.005,
                    diameterRatio: 3,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (value) {
                      setMinutes(value);
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 13,
                      builder: (context, index) {
                        return MyMinutes(
                          mins: index * 5,
                          fontSize: 30,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    ":\tMinutes",
                    style: GoogleFonts.rowdies(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  
                ],
              ),
              // Container(
              //   height: 50,
              //   width: 50,
              //   color: Colors.red[700],
              //   child: Center(
              //     //builder to represent seconds
              //     child: ListWheelScrollView.useDelegate(
              //       itemExtent: 50,
              //       perspective: 0.005,
              //       diameterRatio: 1.2,
              //       physics: const FixedExtentScrollPhysics(),
              //       onSelectedItemChanged:(value) {setSeconds(value);},
              //       childDelegate: ListWheelChildBuilderDelegate(
              //         childCount: 60,
              //         builder: (context, index) {
              //           return MySeconds(secs: index);
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ]),
            SetButton(setTimer: setTimer)
          ],
        ),
      ),
    );
  }
}
