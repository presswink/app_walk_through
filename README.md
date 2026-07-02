# app_walk_through

A new Flutter plugin plugins for application walk through.

## Getting Started

### Installation

Add `app_walk_through` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  app_walk_through: ^1.0.4
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

## Features and Customization

The `AppWalkThrough` widget provides several properties for customization:

| Property              | Description                                                                        |
|:----------------------|:-----------------------------------------------------------------------------------|
| `models`              | List of `AppWalkThroughDataModel` containing title, description, and image assets. |
| `onNextButtonPressed` | Callback triggered after the last slide's next button is pressed.                  |
| `onSkipButtonPressed` | Callback triggered when the skip button is pressed.                                |
| `titleStyle`          | `TextStyle` for the slide titles.                                                  |
| `descriptionStyle`    | `TextStyle` for the slide descriptions.                                            |
| `nextButtonColor`     | `Color` for the forward arrow icon.                                                |
| `skipButtonStyle`     | `TextStyle` for the skip button text.                                              |

## package demo

<img src="./screenshots/video.gif" width="250" height="500" alt="touch_ripple_effect">

## contributors

![@Aditya panther](https://github.com/Adityapanther/)
