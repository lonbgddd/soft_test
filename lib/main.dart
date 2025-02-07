import 'package:flutter/material.dart';
import 'package:shopping_cart/core/app/app.dart';
import 'package:shopping_cart/core/database/local/database.dart';

void main() {
  AppDatabase db = AppDatabase.instance;
  runApp(const App());
}
