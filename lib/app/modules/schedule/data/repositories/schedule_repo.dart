import '../data_sources/schedule_webservice.dart';

class ScheduleRepo {
  final webservice = ScheduleWebservice();

  Future<void> getSchedule() async {
    final data = await webservice.getSchedule();

  }
}
