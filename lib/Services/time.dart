import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String Location;
  late String time;
  late String flag;
  late String urlOfLocation; // location url eg Asia/Kolkata
  late bool isDayTime;

  WorldTime(
      {required this.Location,
      required this.flag,
      required this.urlOfLocation});

  Future<void> getTime() async {
    try {
      var url =
          Uri.parse('https://worldtimeapi.org/api/timezone/$urlOfLocation');
      // making the request
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);
      // print(data);
      // getting properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      String minute = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offset), minutes: int.parse(minute)));

      // setting time property
      if (now.hour > 6 && now.hour < 19) {
        isDayTime = true;
      } else {
        isDayTime = false;
      }
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get the time';
    }
  }
}
