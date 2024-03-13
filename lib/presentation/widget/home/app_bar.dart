import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
          onPressed: () {},
          icon: const Badge(
            isLabelVisible: true,
            child: Icon(Icons.notifications_none),
          ),
        ),
      )
    ],
  );
}
