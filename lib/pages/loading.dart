import 'package:flutter/material.dart';
import 'package:world_time/Services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime obj = WorldTime(
        Location: 'Kolkata', flag: 'india.png', urlOfLocation: 'Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.Location,
      'flag': obj.flag,
      'time': obj.time,
      'isDaytime': obj.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
            child: SpinKitRotatingCircle(
          color: Color.fromARGB(255, 234, 230, 235),
          size: 50.0,
        )));
  }
}
