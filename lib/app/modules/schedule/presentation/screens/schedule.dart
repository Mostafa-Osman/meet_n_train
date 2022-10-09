import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/modules/schedule/presentation/cubit/schedule_cubit.dart';

import '../../../../common/themes/app_colors.dart';
import '../../../../widgets/defaulr_text.dart';
import '../widgets/custom_cart.dart';
import '../widgets/schedule_timeline.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleCubit = BlocProvider.of<ScheduleCubit>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Image.asset(
            'assets/icons/left-arrow.png',
          ),
          title: const DefaultText(
            title: 'Schedule',
            fontFamily: 'Poppins-semiBold',
            fontSize: 25.0,
          )),
      body: RefreshIndicator(
        color: AppColors.mainColor,
        onRefresh: () async {
          await BlocProvider.of<ScheduleCubit>(context).getSchedule();
        },
        child: BlocBuilder<ScheduleCubit, ScheduleState>(
          builder: (context, state) {
            return state is ScheduleLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  )
                : state is ScheduleError
                    ? Center(
                        child: DefaultText(
                          title: state.errorMessage,
                          fontFamily: 'Poppins-semiBold',
                          fontSize: 20.0,
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        color: AppColors.whiteColor,
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
                                      border: Border.all(
                                          color: AppColors.mainColor)),
                                  child: const Icon(
                                    Icons.calendar_today_outlined,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                DefaultText(
                                  title:   scheduleCubit.numberOfDate,
                                  fontSize: 40.0,
                                    fontWeight: FontWeight.w900
                                ),
                                const SizedBox(width: 5.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                        title:  scheduleCubit.dateName,
                                      textColor: AppColors.greyColor,
                                      fontSize: 15.0,
                                    ),
                                    DefaultText(
                                      title:   scheduleCubit.date,
                                        fontSize: 15.0,
                                        fontFamily: 'Poppins-semiBold',
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification) {
                                if (ScrollNotification.metrics.pixels >=
                                    330 * (scheduleCubit.index + 1)) {
                                  scheduleCubit.incrementIndex();
                                } else if (ScrollNotification.metrics.pixels <
                                    230 * (scheduleCubit.index + 1)) {
                                  scheduleCubit.decrementIndex();
                                }
                                return false;
                              },
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 170.0,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ScheduleTimeline(index: index),
                                          const SizedBox(width: 10.0),
                                          Expanded(
                                              child: CustomCart(index: index)),
                                        ],
                                      );
                                    },
                                    itemCount:
                                        scheduleCubit.scheduleModel.length),
                              ),
                            ),
                          ],
                        ));
          },
        ),
      ),
    );
  }
}
