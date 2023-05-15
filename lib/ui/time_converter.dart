import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TimeConverter extends StatefulWidget {
  const TimeConverter({Key? key}) : super(key: key);

  @override
  State<TimeConverter> createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  String _currentTime = '';
  String _currentZone = 'WIB';

  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      //_currentDate = DateFormat('EEEE, d MMMM y').format(DateTime.now());
      if(_currentZone == 'WIB'){
        _currentTime = DateFormat('HH:mm:ss').format(tz.TZDateTime.now(tz.getLocation('Asia/Jakarta')));
      }else if(_currentZone == 'WITA'){
        _currentTime = DateFormat('HH:mm:ss').format(tz.TZDateTime.now(tz.getLocation('Asia/Makassar')));
      }else if(_currentZone == 'WIT'){
        _currentTime = DateFormat('HH:mm:ss').format(tz.TZDateTime.now(tz.getLocation('Asia/Jayapura')));
      }else{
      _currentTime = DateFormat('HH:mm:ss').format(tz.TZDateTime.now(tz.getLocation('Europe/London')));
      }
    });
    Future.delayed(Duration(seconds: 1), () => _updateTime());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Time Converter'),
            backgroundColor: Colors.orange[700],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '$_currentTime',
                    style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: 80
                    )
                  //Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        value: _currentZone,
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentZone = newValue!;
                          });
                        },
                        items: <String>['WIB', 'WITA', 'WIT', 'London'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
