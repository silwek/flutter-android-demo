import 'package:flutter/material.dart';
import 'package:flutter_android_demo/common/app_config.dart';
import 'package:flutter_android_demo/common/contact_demo.dart';
import 'package:flutter_android_demo/common/image_picker.dart';

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
    var config = AppConfig.of(context);
    return _buildApp(config.appName, config.routes);
  }

  Widget _buildApp(String appName, Map<String, Widget Function(BuildContext)> routes) {
    return MaterialApp(
        title: appName,
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
        routes: routes
    );
  }
}
