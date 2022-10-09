import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../cubit/schedule_cubit.dart';

class ScheduleTimeline extends StatelessWidget {
  const ScheduleTimeline({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final scheduleCubit = BlocProvider.of<ScheduleCubit>(context);

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
          indicatorXY: 0.1,
          indicator: Container(
            padding: const EdgeInsets.only(top: 10.0),
            decoration: const BoxDecoration(
                color: Color(0xFFFF5040),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                Text(
                  scheduleCubit
                      .formatDate(
                          scheduleCubit.scheduleModel[index].date, 'dd')
                      .toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  scheduleCubit
                      .formatDate(
                          scheduleCubit.scheduleModel[index].date, 'EE')
                      .toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
