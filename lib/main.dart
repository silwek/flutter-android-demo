
import 'dart:async';
import 'package:add_to_calendar/add_to_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_demo/contact_demo.dart';
import 'package:flutter_android_demo/image_picker.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class Routes {
  static const String homepage = '/';
  static const String imagePickerPage = '/image';
  static const String contactPage = '/contact';
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.homepage,
        routes: {
          Routes.homepage: (context) =>
              MyHomePage(title: 'Flutter Demo Home Page'),
          Routes.imagePickerPage: (context) => ImagePickerScreen(),
          Routes.contactPage: (context) => ContactDemoScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
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

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openMap() async{
    await MapLauncher.showDirections(
      mapType: Theme.of(context).platform == TargetPlatform.iOS ? MapType.apple : MapType.google,
      destination: Coords(45.7583991,4.8302933)
    );
  }



  Future _addEventToCalendar () async{
    await AddToCalendar.addToCalendar(title: "Evènement Flutter", startTime: DateTime.now(), isAllDay: true);
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.lipsum.com/';
    const String _phone = '0123456789';
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.imagePickerPage);
                },
                child: Text(
                  'Image Picker',
                )),
            ElevatedButton(
                onPressed: () => setState(() {
                      _launched = _launchInBrowser(toLaunch);
                    }),
                child: Text(
                  'Open simple url',
                )),
            ElevatedButton(
              onPressed: () => setState(() {
                _launched = _makePhoneCall('tel:$_phone');
              }),
              child: const Text('Make phone call'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                Navigator.pushNamed(context, Routes.contactPage);
              }),
              child: const Text('Contacts'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _openMap();
              }),
              child: const Text('Open map at'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _addEventToCalendar();
              }),
              child: const Text('Add event to calendar'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                Share.share("https://github.com/silwek/flutter-android-demo");
              }),
              child: const Text('Share link'),
            ),
          ],
        ),
      ),
    );
  }
}