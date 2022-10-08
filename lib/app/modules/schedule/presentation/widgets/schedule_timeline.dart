import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ScheduleTimeline extends StatelessWidget {
  const ScheduleTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 342.0,
      width: 50.0,
      child: TimelineTile(
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.start,
        lineXY: 0.0,
        beforeLineStyle: LineStyle(thickness: 1.5, color: Colors.grey.shade300),
        indicatorStyle: IndicatorStyle(
          height: 55.0,
          width: 35.0,
          indicator: Container(
            padding: const EdgeInsets.only(top: 10.0),
            decoration: const BoxDecoration(
                color: Color(0xFFFF5040),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: const [
                Text(
                  '13',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'sun',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        // endChild: Container(
        //   constraints: const BoxConstraints(
        //     minWidth: 10,
        //   ),
        //   color: Colors.lightGreenAccent,
        // ),
        // startChild: Container(
        //   color: Colors.amberAccent,
        // ),
      ),
    );
  }
}
