import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.apiBaseUrl,
    @required this.routes,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String apiBaseUrl;
  final Map<String, WidgetBuilder> routes;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
