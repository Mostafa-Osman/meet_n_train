import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/cubit/schedule_cubit.dart';

import '../widgets/custom_cart.dart';
import '../widgets/schedule_timeline.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Image.asset(
          'assets/icons/left-arrow.png',
        ),
        title: const Text(
          'Schedule',
          style: TextStyle(fontFamily: 'Poppins-semiBold', color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xFFFF5040),
        onRefresh: () async {
          await BlocProvider.of<ScheduleCubit>(context).getSchedule();
        },
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          border: Border.all(color: const Color(0xFFFF5040))),
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFFFF5040),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      '11',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Friday',
                          style: TextStyle(
                              color: Colors.grey, fontFamily: 'Poppins'),
                        ),
                        Text(
                          'Nov 2022',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Poppins-semiBold',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 170.0,
                  width: double.infinity,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            ScheduleTimeline(),
                            SizedBox(width: 10.0),
                            Expanded(child: CustomCart()),
                          ],
                        );
                      },
                      itemCount: 10),
                ),
              ],
            )),
      ),
    );
  }
}
