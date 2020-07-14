# Gesture Recorder

TODO: add pub.dev link here

A tool to record gestures for a flutter app for generating a test case, and for
replaying the recorded gestures for test purposes

## Usage
To use this package, add `gesture_recorder` as a
[dev_dependencies in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Example

Under the `example/` directory, first record a gesture by funning:
```
flutter drive -t test/record_gesture.dart -d pixel --trace-startup
```

Than replay the recorded gesture by
```
flutter drive -t test/replay_gesture.dart -d pixel --trace-startup
```
