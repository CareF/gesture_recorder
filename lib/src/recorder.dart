import 'dart:developer';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import 'pointer_data_converter.dart';

PointerDataPacketCallback _originalHandler;

/// Enables the gesture recording on the app to the [Timeline].
///
/// Notice that enabling gesture recording can significantly reduce the
/// performance of an app due to serializing heavy data flow.
void enableGestureRecorder() {
  assert(WidgetsBinding.instance != null);
  assert(!kReleaseMode);
  assert(_originalHandler == null);
  final Window window = WidgetsBinding.instance.window;
  _originalHandler = window.onPointerDataPacket;
  window.onPointerDataPacket = (PointerDataPacket packet) {
    Timeline.instantSync(
      'Received PointerDataPacket',
      arguments: <String, List<Map<String, dynamic>>>{
        'events': <Map<String, dynamic>>[
          for(final PointerData datum in packet.data)
            serializePointerData(datum),
        ],
      },
    );
    _originalHandler(packet);
  };
}


/// Stops the gesutre recording on the app.
///
/// If called before `enableGestureRecorder`, this will trow an assert error.
void disableGestureRecorder() {
  assert(WidgetsBinding.instance != null);
  assert(_originalHandler != null);
  WidgetsBinding.instance.window.onPointerDataPacket = _originalHandler;
  _originalHandler = null;
}
