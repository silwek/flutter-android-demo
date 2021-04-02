import 'package:flutter/material.dart';
import 'package:flutter_android_demo/app2/home_page_2.dart';
import 'package:flutter_android_demo/common/app_config.dart';
import 'package:flutter_android_demo/common/contact_demo.dart';
import 'package:flutter_android_demo/common/image_picker.dart';
import 'package:flutter_android_demo/main_common.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Build flavors App2',
    flavorName: 'app2',
    apiBaseUrl: 'https://dev-api.example.com/',
    routes: {
      Routes.homepage: (context) =>  MyHomePage2(title: 'Flutter Demo Home Page'),
      Routes.imagePickerPage: (context) => ImagePickerScreen(),
      Routes.contactPage: (context) => ContactDemoScreen(),
    },
    child: MyApp(),
  );

  runApp(configuredApp);
}