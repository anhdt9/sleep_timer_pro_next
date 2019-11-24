import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:sleep_timer_pro_next/constants/AppConstants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../NavigatorController.dart';
import 'AboutSreen.dart';
import 'SettingScreen.dart';

class HomeScreen extends StatelessWidget {
  static const MENU_SETTINGS = 1;
  static const MENU_RATE_1_STAR = 2;
  static const MENU_ABOUT = 3;

  @override
  Widget build(BuildContext context) {
    _launchUrl() async {
      const urlAndroid =
          'https://play.google.com/store/apps/details?id=com.tunm.sleeptimer';
      if (Platform.isAndroid) {
        if (await canLaunch(urlAndroid)) {
          await launch(urlAndroid);
        } else {
          throw 'Could not launch $urlAndroid';
        }
      }
    }

    _selectMenu(int value) {
      switch (value) {
        case MENU_SETTINGS:
          NavigatorController.push(context, SettingScreen());
          break;
        case MENU_RATE_1_STAR:
          _launchUrl();
          break;
        case MENU_ABOUT:
          NavigatorController.push(context, AboutSreen());
          break;
      }
    }

    List<Widget> _getHomeActions() {
      return <Widget>[
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Settings"),
              value: MENU_SETTINGS,
            ),
            PopupMenuItem(
              child: Text("Rate 1 star"),
              value: MENU_RATE_1_STAR,
            ),
            PopupMenuItem(
              child: Text("About"),
              value: MENU_ABOUT,
            )
          ],
          onSelected: _selectMenu,
        )
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Timer"),
        actions: _getHomeActions(),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _startStopClick() {}

    Widget _totalValue(double minute) {
      int valueMinute = 2 * minute ~/ 2;
      String printText = valueMinute > 9 ? valueMinute.toString() : "0"+valueMinute.toString();
      return Center(
        child: Text(
          "$printText : 00",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      );
    }

    Widget _slideMinute(int valueHour) {
      return SleekCircularSlider(
          min: 0,
          max: 13,
          initialValue: 0,
          innerWidget: _totalValue,
          appearance: CircularSliderAppearance(
              startAngle: 180,
              angleRange: 360,
              size: 220,
              customWidths: CustomSliderWidths(
                progressBarWidth: 20,
                handlerSize: 20,
              )),
          onChange: (double value) {
//            print(value);
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
//          print(value);
        });

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
