import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart' hide TypeMatcher, isInstanceOf;

import 'timeline_pointer_data.dart';

/// Adaptor to `flutter_driver`
void recorderDriver(Duration recordTime, [String sessionName='record_gesture']) {
  assert(recordTime != null);
  assert(sessionName != null);
  group(sessionName, ()
  {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      if (driver != null)
        driver.close();
    });

    test('Waiting for 5s...', () async {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      await driver.forceGC();

      final Timeline timeline = await driver.traceAction(() async {
        // Find the scrollable stock list
        await Future<void>.delayed(recordTime);
      });
      final PointerDataRecord inputEvents = PointerDataRecord.filterFrom(timeline);
      inputEvents.writeToFile(sessionName, pretty: true, asDart: true);
    });
  });
}
