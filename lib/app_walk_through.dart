

import 'package:app_walk_through/src/app_walk_through_data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export './src/app_walk_through_data_model.dart';

class AppWalkThrough extends StatefulWidget {
  final List<AppWalkThroughDataModel> models;
  final void Function() onNextButtonPressed;
  final void Function() onSkipButtonPressed;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  const AppWalkThrough({
    super.key,
    required this.models,
    required this.onNextButtonPressed,
    required this.onSkipButtonPressed,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  State<AppWalkThrough> createState() => _AppWalkThroughState();
}

class _AppWalkThroughState extends State<AppWalkThrough> {
  final List<Widget> _indicatorList = [];
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _dotIndicator(int index, int cp) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      width: 12,
      height: 12,
      child: null,
      decoration: BoxDecoration(
        color: index == cp ? Colors.white : Colors.grey,
        border: Border.all(color: Colors.grey, width: 1),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void initState() {
    _buildList();
    super.initState();
  }

  void _buildList() {
    _indicatorList.clear();
    widget.models.asMap().forEach((int index, _) {
      setState(() {
        _indicatorList.add(_dotIndicator(index, _currentPage));
      });
    });
  }

  void _pageHandler(int index) {
    _currentPage = index;
    _buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.topStart,
        fit: StackFit.expand,
        children: [
          PageView.builder(
              onPageChanged: _pageHandler,
              controller: _pageController,
              itemCount: widget.models.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.models[index].image!),
                          fit: BoxFit.fill)),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  widget.models[index].title!,
                                  style: widget.titleStyle ?? GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ))),
                        Expanded(flex: 10, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      widget.models[index].description!,
                                      style: widget.descriptionStyle ?? GoogleFonts.notoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: widget.onSkipButtonPressed,
                          child: Text(
                            "Skip",
                            style: GoogleFonts.notoSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ))),
                  Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _indicatorList,
                      )),
                  Expanded(
                    child: IconButton(
                        iconSize: 36.0,
                        onPressed: () {
                          if (_currentPage < widget.models.length -1) {
                            int nextIndex = _currentPage + 1;
                            _pageController.animateToPage(nextIndex,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            _pageHandler(nextIndex);
                          } else {
                            widget.onNextButtonPressed();
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          )
        ]);
  }
}
