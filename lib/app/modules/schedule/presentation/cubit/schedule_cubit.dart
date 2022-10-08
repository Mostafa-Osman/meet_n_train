import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/modules/schedule/data/repositories/schedule_repo.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());
  final scheduleRepo = ScheduleRepo();

  Future<void> getSchedule() async {
    emit(ScheduleLoading());

    try {
      await scheduleRepo.getSchedule();

      emit(ScheduleSuccess());
    } catch (e, s) {
      emit(ScheduleError(errorMessage: e.toString()));

      log(e.toString(), stackTrace: s);
    }
  }

// Future<void> onRefresh(RefreshController refreshController) async {
//   currentPage = 1;
//   faqs = await authRepo.getFAQs(page: currentPage);
//   emit(FaqsRefreshUI());
//   refreshController.refreshCompleted();
// }
}
