import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'pointer_data_converter.dart';

/// Replay the gesture recorded to the `jsonString`.
Future<List<Duration>> replayRecord(WidgetTester tester, String jsonString) {
    return tester.handlePointerEventRecord(pointerEventRecordFromJson(
      jsonString,
      tester.binding.window.devicePixelRatio,
    ));
}
