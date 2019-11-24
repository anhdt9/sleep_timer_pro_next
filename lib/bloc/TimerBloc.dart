import 'package:flutter/material.dart';

class TimerBloc extends ChangeNotifier {
  var _time = ["00", "00"];

  get time => _time;

  void changeHour(double hour) {
    int valueHour = 2 * hour ~/ 2;
    _time[0] = _getTxtTime(valueHour);
    notifyListeners();
  }

  void changeMinute(double minute) {
    int valueMinute = 2 * minute ~/ 2;
    _time[1] = _getTxtTime(valueMinute);

    notifyListeners();
  }

  String _getTxtTime(int value) {
    return value > 9 ? value.toString() : "0" + value.toString();
  }
}
