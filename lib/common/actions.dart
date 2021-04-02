import 'dart:async';
import 'package:add_to_calendar/add_to_calendar.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AppActions{
  static Future launchInBrowser() async {
    final url = 'https://www.lipsum.com/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future makePhoneCall() async {
    final url = 'tel:0123456789';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future openMap(BuildContext context) async {
    await MapLauncher.showDirections(
        mapType: Theme.of(context).platform == TargetPlatform.iOS
            ? MapType.apple
            : MapType.google,
        destination: Coords(45.7583991, 4.8302933));
  }

  static Future addEventToCalendar() async {
    await AddToCalendar.addToCalendar(
        title: "Evènement Flutter", startTime: DateTime.now(), isAllDay: true);
  }

  static Future shareLink() async {
    Share.share("https://github.com/silwek/flutter-android-demo");
  }
}