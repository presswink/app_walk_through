import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

/// This is the [AppWalkThrough] data model which helps define app short descriptions.
///
/// It contains the content for each slide in the walkthrough.
class AppWalkThroughDataModel {
  /// The title text shown at the top of the slide.
  String? title;

  /// The description text shown at the bottom of the slide.
  String? description;

  /// The asset path for the background image of the slide.
  String? image;

  /// Creates a data model for a single walkthrough slide.
  AppWalkThroughDataModel({this.title, this.description, this.image});
}

/// A widget that provides a walkthrough/onboarding experience for your app.
///
/// Use this widget to showcase your app's features and main idea to the user.
/// It displays a series of slides with images, titles, and descriptions,
/// including a dot indicator and navigation buttons.
class AppWalkThrough extends StatefulWidget {
  /// A list of [AppWalkThroughDataModel] containing the features and descriptions to display.
  final List<AppWalkThroughDataModel> models;

  /// Callback function triggered when the "Next" button is pressed on the last slide.
  /// This is typically used to navigate to the main screen of the app.
  final void Function() onNextButtonPressed;

  /// Callback function triggered when the "Skip" button is pressed.
  /// This allows the user to bypass the walkthrough entirely.
  final void Function() onSkipButtonPressed;

  /// Optional [TextStyle] for the title text on each slide.
  final TextStyle? titleStyle;

  /// Optional [TextStyle] for the description text on each slide.
  final TextStyle? descriptionStyle;

  /// Optional [Color] for the next button icon. Defaults to [Colors.white].
  final Color? nextButtonColor;

  /// Optional [TextStyle] for the "Skip" button text.
  final TextStyle? skipButtonStyle;

  /// Creates an [AppWalkThrough] widget.
  const AppWalkThrough({
    super.key,
    required this.models,
    required this.onNextButtonPressed,
    required this.onSkipButtonPressed,
    this.titleStyle,
    this.descriptionStyle,
    this.nextButtonColor,
    this.skipButtonStyle,
  });

  @override
  State<AppWalkThrough> createState() => _AppWalkThroughState();
}

class _AppWalkThroughState extends State<AppWalkThrough> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  /// [index] of the slides
  void _pageHandler(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _dotIndicator(int index) {
    return TouchRippleEffect(
      rippleColor: Colors.transparent,
      onTap: () {
        _pageHandler(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 3, right: 3),
        width: 12,
        height: 12,
        child: null,
        decoration: BoxDecoration(
          color: index == _currentPage ? Colors.white : Colors.grey,
          border: Border.all(color: Colors.grey, width: 1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  /// will build the list of dot indicators
  List<Widget> _buildList() {
    List<Widget> indicatorList = [];
    widget.models.asMap().forEach((index, value) {
      indicatorList.add(_dotIndicator(index));
    });
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.expand,
      textDirection: TextDirection.ltr,
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          controller: _pageController,
          itemCount: widget.models.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.models[index].image!),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Text(
                          widget.models[index].title!,
                          textDirection: TextDirection.ltr,
                          style:
                              widget.titleStyle ??
                              TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ),
                    ),
                    Expanded(flex: 10, child: Container()),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                widget.models[index].description!,
                                textDirection: TextDirection.ltr,
                                style:
                                    widget.descriptionStyle ??
                                    TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(bottom: 20),
            height: 40,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,

                    child: TextButton(
                      onPressed: widget.onSkipButtonPressed,
                      child: Text(
                        "skip",
                        textDirection: TextDirection.ltr,
                        style:
                            widget.skipButtonStyle ??
                            TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: _buildList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      alignment: Alignment.center,
                      iconSize: 36.0,
                      onPressed: () {
                        if (_currentPage < widget.models.length - 1) {
                          int nextIndex = _currentPage + 1;
                          _pageHandler(nextIndex);
                        } else {
                          widget.onNextButtonPressed();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: widget.nextButtonColor ?? Colors.white,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
