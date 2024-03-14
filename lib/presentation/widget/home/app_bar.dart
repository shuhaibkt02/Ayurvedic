import 'package:flutter/material.dart';

AppBar appBar({required TextTheme textTheme,String? title}) {
  return AppBar(
    elevation: 1,
    title: title != null
        ? Text(
            title,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          )
        : null,
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
