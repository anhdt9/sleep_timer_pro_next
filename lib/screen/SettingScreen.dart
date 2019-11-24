import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleep_timer_pro_next/constants/AppConstants.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.themeColor,
          title: Text("Setting"),
        ),
        body: SettingBody(),
      ),
    );
  }
}

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _themeLayout(),
            Divider(
              color: Colors.white,
            ),
            _timeLayout(),
            Divider(
              color: Colors.white,
            ),
            _onSleepLayout(),
            Divider(
              color: Colors.white,
            ),
            _othersLayout(),
          ],
        ),
      ),
    );
  }

  Widget _themeLayout() {
    _themePrimaryColorClick() {}

    _themeMinuteColorClick() {}

    _themeHourColorClick() {}

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Theme",
            style: TextStyle(color: AppConstants.themeColor),
          ),
        ),
        ListTile(
          title: Text(
            "Primary color",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: AppConstants.themeColor, shape: BoxShape.circle),
            child: RawMaterialButton(onPressed: _themePrimaryColorClick),
          ),
        ),
        ListTile(
          title: Text(
            "Minute circle color",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: AppConstants.minuteColor, shape: BoxShape.circle),
            child: RawMaterialButton(onPressed: _themeMinuteColorClick),
          ),
        ),
        ListTile(
          title: Text(
            "Hour circle color",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: AppConstants.hourColor, shape: BoxShape.circle),
            child: RawMaterialButton(onPressed: _themeHourColorClick),
          ),
        ),
      ],
    );
  }

  Widget _timeLayout() {
    _timeLayoutClick() {}

    return Column(children: <Widget>[
      ListTile(
        title: Text(
          "Time",
          style: TextStyle(color: AppConstants.themeColor),
        ),
      ),
      ListTile(
        title: Text(
          "Extended time",
          style: TextStyle(color: Colors.white),
        ),
        trailing: GestureDetector(
          child: Text(
            "+10 mintes",
            style: TextStyle(color: AppConstants.themeColor, fontSize: 17),
          ),
          onTap: _timeLayoutClick,
        ),
      ),
    ]);
  }

  Widget _onSleepLayout() {
    _onSleepGotoHomeScreen(bool value) {}

    _onSleepSlientScreen(bool value) {}

    _onSleepTurnoffScreen(bool value) {}

    return Column(children: <Widget>[
      ListTile(
        title: Text(
          "On Sleep",
          style: TextStyle(color: AppConstants.themeColor),
        ),
      ),
      ListTile(
        title: Text(
          "Go to Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          value: true,
          onChanged: _onSleepGotoHomeScreen,
        ),
      ),
      ListTile(
        title: Text(
          "Turn off Screen",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          value: true,
          onChanged: _onSleepTurnoffScreen,
        ),
      ),
      ListTile(
        title: Text(
          "Slient mode",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          value: true,
          onChanged: _onSleepSlientScreen,
        ),
      ),
    ]);
  }

  Widget _othersLayout() {
    _otherTurnOffWifi(bool value) {}

    _otherTurnOffBluetooth(bool value) {}

    return Column(children: <Widget>[
      ListTile(
        title: Text(
          "Others",
          style: TextStyle(color: AppConstants.themeColor),
        ),
      ),
      ListTile(
        title: Text(
          "Turn off Wifi",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          value: true,
          onChanged: _otherTurnOffWifi,
        ),
      ),
      ListTile(
        title: Text(
          "Turn off Bluetooth",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          value: true,
          onChanged: _otherTurnOffBluetooth,
        ),
      ),
    ]);
  }
}
