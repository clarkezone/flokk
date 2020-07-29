import 'package:flutter/material.dart';

class AppGlobals {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();

  static NavigatorState get nav => rootNavKey.currentState;

  static ContactStoreType get contactStoreType => ContactStoreType.Microsoft;
}

enum ContactStoreType { Google, Microsoft }
