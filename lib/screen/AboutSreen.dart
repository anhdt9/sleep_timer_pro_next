import 'package:flutter/material.dart';
import 'package:sleep_timer_pro_next/constants/AppConstants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var version = "1.2.0";
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.themeColor,
          title: Text("About"),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "./assets/about.gif",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
              SizedBox(
                child: Divider(
                  color: Colors.white,
                ),
                width: 300,
                height: 50,
              ),
              Text(
                "Sleep Timer",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Version $version",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sleep Timer helps you to schedule music off time to save phone power and help you have a good sleep with just one click.",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Develop by Candy Star",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "For more infomation please connect with",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              GestureDetector(
                onTap: _sendEmail,
                child: Text(
                  "candystarvn@gmail.cơm",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendEmail() async {
    var url = "mailto:candystarvn@gmail.cơm";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
