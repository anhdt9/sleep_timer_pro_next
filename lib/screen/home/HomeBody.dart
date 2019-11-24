
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:sleep_timer_pro_next/bloc/TimerBloc.dart';
import 'package:sleep_timer_pro_next/constants/AppConstants.dart';

class HomeBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<TimerBloc>(context);

    Widget _showTime(double minute) {
      String hour = bloc.time[0];
      String minute = bloc.time[1];
      return Center(
        child: Text(
          "$hour : $minute",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      );
    }

    Widget _slideMinute(int valueHour) {
      return SleekCircularSlider(
          min: 0,
          max: 13,
          initialValue: 0,
          innerWidget: _showTime,
          appearance: CircularSliderAppearance(
              startAngle: 180,
              angleRange: 360,
              size: 220,
              customWidths: CustomSliderWidths(
                progressBarWidth: 20,
                handlerSize: 20,
              )),
          onChange: (double value) {
            bloc.changeHour(value);
          });
    }

    Widget _customInnerHour(double hour) {
      return Center(
        child: _slideMinute(2 * hour ~/ 2),
      );
    }

    final _sliderLayout = SleekCircularSlider(
        min: 0,
        max: 61,
        initialValue: 0,
        innerWidget: _customInnerHour,
        appearance: CircularSliderAppearance(
            startAngle: 180,
            angleRange: 360,
            size: 300,
            customWidths: CustomSliderWidths(
              progressBarWidth: 15,
              handlerSize: 20,
            )),
        onChange: (double value) {
          bloc.changeMinute(value);
        });


    _startStopClick() {

      final notifications = FlutterLocalNotificationsPlugin();

    }

    return Material(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          SizedBox(
            child: Center(
              child: _sliderLayout,
            ),
          ),
          Container(
            child: Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppConstants.themeColor,
                    onPressed: _startStopClick,
                    child: Text(
                      "Start now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
