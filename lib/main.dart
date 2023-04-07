import 'package:flutter/material.dart';
import 'package:todo_app/main_widget.dart';
import 'core/service_locator.dart' as di;

void main() {
  di.init();
  runApp(const MainWidget());
}
