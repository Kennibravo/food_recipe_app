import 'package:flutter/material.dart';

enum CURRENT_STACK { intro, details }

class DrawerProvider extends ChangeNotifier {
  var introScreen = {
    'xOffset': 0.0,
    'yOffset': 0.0,
    'scaleFactor': 1.0,
    'drawerOpen': false,
  };

  var detailsScreen = {
    'xOffset': 0.0,
    'yOffset': 0.0,
    'scaleFactor': 1.0,
    'drawerOpen': false,
  };

  CURRENT_STACK currentStack = CURRENT_STACK.intro;

  void openDrawer(MediaQueryData mediaQuery) {
    introScreen['xOffset'] = mediaQuery.size.width * 0.5;
    introScreen['yOffset'] = mediaQuery.size.height / 5;
    introScreen['scaleFactor'] = 0.6;
    introScreen['drawerOpen'] = true;

    detailsScreen['xOffset'] = mediaQuery.size.width * 0.4;
    detailsScreen['yOffset'] = mediaQuery.size.height / 7;
    detailsScreen['scaleFactor'] = 0.6;

    notifyListeners();
  }

  void closeDrawer() {
    introScreen['xOffset'] = 0;
    introScreen['yOffset'] = 0;
    introScreen['scaleFactor'] = 1.0;
    introScreen['drawerOpen'] = false;

    detailsScreen['xOffset'] = 0;
    detailsScreen['yOffset'] = 0;
    detailsScreen['scaleFactor'] = 1.0;

    notifyListeners();
  }

  void displayingIntro() {
    currentStack = CURRENT_STACK.intro;
    closeDrawer();
    notifyListeners();
  }

  void displayingDetails() {
    currentStack = CURRENT_STACK.details;
    closeDrawer();
    notifyListeners();
  }
}
