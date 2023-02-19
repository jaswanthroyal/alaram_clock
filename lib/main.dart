import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alaram Clock'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Create alarm',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              var time = DateTime.now();
              count++;
              print("count is ${count}");
              int hour = time.hour;
              int minutes = time.minute;
              int addMinutes = 5 * count;
              int addHour = 0;
              if (minutes + addMinutes > 59) {
                int x = 60 - minutes;
                addMinutes = addMinutes - x;
                double b = addMinutes / 60;
                addHour = b.toInt() + 1;
                print("Hour is ${addHour}");
                hour = hour + addHour;
                minutes = addMinutes % 60;
              } else {
                minutes = minutes + addMinutes;
              }
              FlutterAlarmClock.createAlarm(hour, minutes);
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            FlutterAlarmClock.showAlarms();
          },
          child: const Text(
            'Show Alarms',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ])),
    );
  }
}
