import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pomodoro_app/widgets/minutes.dart';

class MinuteScroller extends StatelessWidget {
  int _mins = 25;
  VoidCallback resetTimer;
  MinuteScroller({super.key, required this.resetTimer});

  

  int? setMinutes(int index){
    _mins = index * 5;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
              height: 100,
              width: 140,
              child: ListWheelScrollView.useDelegate(
                squeeze: 1,
                itemExtent: 100,
                perspective: 0.0005,
                diameterRatio: 3,
                onSelectedItemChanged: ((value) => setMinutes(value)),
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 13,
                  builder: (context, index) {
                    return MyMinutes(mins: index*5, fontSize: 100,);
                  },
                ),
              )),
        ),
            SizedBox(height: 23,)
      ],
    );
  }
}
