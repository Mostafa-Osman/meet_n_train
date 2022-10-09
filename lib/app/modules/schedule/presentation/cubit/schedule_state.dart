part of 'schedule_cubit.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleSuccess extends ScheduleState {}

class ScheduleError extends ScheduleState {
  final String errorMessage;

  ScheduleError({required this.errorMessage});
}
class RefreshUi extends ScheduleState {}

