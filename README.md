# app_walk_through

A new Flutter plugin plugins for application walk through.

## Getting Started

### Installation

Add `app_walk_through` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  app_walk_through: ^1.0.2
```

### Usage

Import the package:

```dart
import 'package:app_walk_through/app_walk_through.dart';
```

Check out the [example](example/lib/main.dart) for a full implementation.

## Example

```dart
AppWalkThrough(
  models: [
    AppWalkThroughDataModel(
      title: "Welcome",
      description: "Description here",
      image: "assets/images/img1.jpg",
    ),
  ],
  onNextButtonPressed: () {
    // Navigate to next screen
  },
  onSkipButtonPressed: () {
    // Skip walkthrough
  },
)
```

## package demo

<img src="./screenshots/video.gif" width="250" height="500" alt="touch_ripple_effect">

## contributors

![@Aditya panther](https://github.com/Adityapanther/)
