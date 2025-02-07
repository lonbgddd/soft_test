import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/config.dart';
import 'package:shopping_cart/core/database/local/database.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppDatabase database = AppDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: AppConfig.appName,
        routerConfig: AppConfig.routerConfig,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
