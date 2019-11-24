import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_timer_pro_next/bloc/TimerBloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../NavigatorController.dart';
import '../AboutSreen.dart';
import '../SettingScreen.dart';
import 'HomeBody.dart';

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
      body: ChangeNotifierProvider(
        builder: (context) => TimerBloc(),
        child: HomeBody(),
      ),
    );
  }
}
