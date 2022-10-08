import '../data_sources/schedule_webservice.dart';
import '../model/schedule_model.dart';

class ScheduleRepo {
  final webservice = ScheduleWebservice();

  Future<List<ScheduleModel>> getSchedule() async {
    final data = await webservice.getSchedule();
    return (data)
        .map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
