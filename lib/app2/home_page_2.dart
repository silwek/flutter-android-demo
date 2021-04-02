import 'package:flutter/material.dart';
import 'package:flutter_android_demo/common/actions.dart';
import 'package:flutter_android_demo/main_common.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
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
          child: Row(
            children: [
              Column(
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
                            AppActions.launchInBrowser();
                          }),
                      child: Text(
                        'Open simple url',
                      )),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      AppActions.makePhoneCall();
                    }),
                    child: const Text('Make phone call'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      Navigator.pushNamed(context, Routes.contactPage);
                    }),
                    child: const Text('Contacts'),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => setState(() {
                      AppActions.openMap(context);
                    }),
                    child: const Text('Open map at'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      AppActions.addEventToCalendar();
                    }),
                    child: const Text('Add event to calendar'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      AppActions.shareLink();
                    }),
                    child: const Text('Share link'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
