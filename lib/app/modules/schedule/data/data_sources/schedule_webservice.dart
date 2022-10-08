import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ScheduleWebservice {
  Future<List<dynamic>> getSchedule() async {
    const url ='http://test.meetntrain.com/v1/profile/events/upcoming/8357/?page=1&date_gte=';
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final data = jsonDecode(response.body) as List<dynamic>;
    log(data.toString());
    // if (data['statusCode'] != 200) throw 'server error';
    log(data.toString());
   return data as List<dynamic>;

  }
}
