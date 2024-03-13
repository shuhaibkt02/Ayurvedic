import 'package:flutter/material.dart';

extension NavigatorExtensions on NavigatorState {
  void pushAndRemoveUntilPage(Widget child) {
    pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      (route) => false,
    );
    void pushInto(Widget child) {
      push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation);
        },
      ));
    }
  }
}
