import 'dart:convert' show json;
import 'dart:ui' as ui show PointerData, PointerChange, PointerDeviceKind, PointerSignalKind;

import 'package:flutter_test/flutter_test.dart';
import 'package:gesture_recorder/gesture_recorder.dart';

void main() {
  test('Serialize and deserialize PointerData', () {
    void compare(final ui.PointerData original, final ui.PointerData restored) {
      expect(restored.timeStamp, original.timeStamp);
      expect(restored.change, original.change);
      expect(restored.kind, original.kind);
      expect(restored.signalKind, original.signalKind);
      expect(restored.device, original.device);
      expect(restored.pointerIdentifier, original.pointerIdentifier);
      expect(restored.physicalX, original.physicalX);
      expect(restored.physicalY, original.physicalY);
      expect(restored.physicalDeltaX, original.physicalDeltaX);
      expect(restored.physicalDeltaY, original.physicalDeltaY);
      expect(restored.buttons, original.buttons);
      expect(restored.obscured, original.obscured);
      expect(restored.synthesized, original.synthesized);
      expect(restored.pressure, original.pressure);
      expect(restored.pressureMin, original.pressureMin);
      expect(restored.pressureMax, original.pressureMax);
      expect(restored.distance, original.distance);
      expect(restored.distanceMax, original.distanceMax);
      expect(restored.size, original.size);
      expect(restored.radiusMajor, original.radiusMajor);
      expect(restored.radiusMinor, original.radiusMinor);
      expect(restored.radiusMin, original.radiusMin);
      expect(restored.radiusMax, original.radiusMax);
      expect(restored.orientation, original.orientation);
      expect(restored.tilt, original.tilt);
      expect(restored.platformData, original.platformData);
      expect(restored.scrollDeltaX, original.scrollDeltaX);
      expect(restored.scrollDeltaY, original.scrollDeltaY);
    }

    const ui.PointerData defaultData = ui.PointerData();
    final String defaultDataString = json.encode(
        serializePointerData(defaultData));
    expect(defaultDataString, '{}');
    compare(defaultData, deserializePointerData(defaultDataString));

    const ui.PointerData customizeData = ui.PointerData(
        timeStamp: Duration(hours: 1),
        change: ui.PointerChange.move,
        kind: ui.PointerDeviceKind.invertedStylus,
        signalKind: ui.PointerSignalKind.scroll,
        device: 3,
        pointerIdentifier: 42,
        physicalX: 3.14,
        physicalY: 2.718,
        physicalDeltaX: 1.414,
        physicalDeltaY: 1.732,
        buttons: 4,
        obscured: true,
        synthesized: true,
        pressure: 101.325,
        pressureMin: 0.132,
        pressureMax: 760.0,
        distance: 1.609,
        distanceMax: 3.28,
        size: 0.618,
        radiusMajor: 1.123,
        radiusMinor: 4.567,
        orientation: 1.257,
        tilt: 0.628,
        platformData: 137,
        scrollDeltaX: 273.15,
        scrollDeltaY: 195.42
    );
    compare(customizeData, deserializePointerData(json.encode(
        serializePointerData(customizeData))));
  });
}
