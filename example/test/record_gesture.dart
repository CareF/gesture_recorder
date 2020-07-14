import 'package:gesture_recorder/gesture_recorder.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:simple_scroll/main.dart' as app;

void main() {
  enableFlutterDriverExtension();
  enableGestureRecorder();
  app.main();
}
