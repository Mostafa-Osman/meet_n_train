import 'dart:convert';

import 'package:http/http.dart' as http;

class ScheduleWebservice {
  Future<List<dynamic>> getSchedule() async {
    const url =
        'http://test.meetntrain.com/v1/profile/events/upcoming/8357/?page=25&date_gte=';
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final data = jsonDecode(response.body);
    // log(data.toString());
    return data;
  }
}
