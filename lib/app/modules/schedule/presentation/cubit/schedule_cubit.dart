import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/app/modules/schedule/data/repositories/schedule_repo.dart';
import 'package:intl/intl.dart';

import '../../data/model/schedule_model.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());
  final scheduleRepo = ScheduleRepo();
  int index = 0;
  String date = '';
  String nameOfDay = '';
  String numberOfDate = '';
  List<ScheduleModel> scheduleModel = [];

  Future<void> getSchedule() async {
    emit(ScheduleLoading());
    try {
      scheduleModel = await scheduleRepo.getSchedule();
      titleDate();
      emit(ScheduleSuccess());
    } catch (e, s) {
      emit(ScheduleError(errorMessage: e.toString()));

      log(e.toString(), stackTrace: s);
    }
  }

  String formatDate(String date, String s) {
    DateTime y = DateTime.parse(date);
    final DateFormat formatter = DateFormat(s);
    final String formatted = formatter.format(y);
    return formatted;
  }

  void incrementIndex() {
    if (index < scheduleModel.length) index++;
    titleDate();
    emit(RefreshUi());
  }

  void decrementIndex() {
    if (index > 0) index--;
    titleDate();
    emit(RefreshUi());
  }

  void titleDate() {
    numberOfDate = formatDate(scheduleModel[index].date, 'dd');
    nameOfDay = formatDate(scheduleModel[index].date, 'EEEE');
    date = formatDate(scheduleModel[index].date, 'MMMM yyyy');
    log(index.toString());
    emit(RefreshUi());
  }
}
