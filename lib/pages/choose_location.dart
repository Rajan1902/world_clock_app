import 'package:flutter/material.dart';
import 'package:world_time/Services/time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        Location: 'London', flag: 'uk.png', urlOfLocation: 'Europe/London'),
    WorldTime(
        Location: 'Athens', flag: 'greece.png', urlOfLocation: 'Europe/Athens'),
    WorldTime(
        Location: 'Cairo', flag: 'egypt.png', urlOfLocation: 'Africa/Cairo'),
    WorldTime(
        Location: 'Nairobi',
        flag: 'kenya.png',
        urlOfLocation: 'Africa/Nairobi'),
    WorldTime(
        Location: 'Chicago', flag: 'usa.png', urlOfLocation: 'America/Chicago'),
    WorldTime(
        Location: 'New York',
        flag: 'usa.png',
        urlOfLocation: 'America/New_York'),
    WorldTime(
        Location: 'Seoul',
        flag: 'south_korea.png',
        urlOfLocation: 'Asia/Seoul'),
    WorldTime(
        Location: 'Jakarta',
        flag: 'indonesia.png',
        urlOfLocation: 'Asia/Jakarta'),
    WorldTime(
        Location: 'Kolkata', flag: 'india.png', urlOfLocation: 'Asia/Kolkata'),
    WorldTime(
        Location: 'Berlin', flag: 'germany.png', urlOfLocation: 'Europe/Berlin')
  ];
  void setTime(index) async {
    WorldTime obj2 = locations[index];
    await obj2.getTime();
    // going to home
    Navigator.pop(context, {
      'location': obj2.Location,
      'flag': obj2.flag,
      'time': obj2.time,
      'isDaytime': obj2.isDayTime,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 87, 42, 121),
        appBar: AppBar(
          title: Text('Choose a location'),
          backgroundColor: Color.fromARGB(255, 126, 107, 201),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: (() {
                  setTime(index);
                }),
                title: Text(locations[index].Location),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}')),
              ),
            );
          },
        ));
  }
}
