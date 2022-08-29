import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor =
        data['isDaytime'] ? Color.fromARGB(255, 45, 147, 224) : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                      onSurface: Colors.orange,
                      shadowColor: Colors.black,
                      elevation: 4,
                    ),
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Change Location')),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 40, letterSpacing: 1.5),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 70, letterSpacing: 1.5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
