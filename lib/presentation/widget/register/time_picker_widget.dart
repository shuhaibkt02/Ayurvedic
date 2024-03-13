import 'package:ayurvedic/presentation/widget/register/custom_dropdown.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: mediaWidth / 2.2,
          // color: Colors.red,
          height: 50,
          child: CustomDropDown(
            items: [for (int i = 1; i <= 12; i++) '$i'],
            hintText: 'Hours',
            dropWidth: mediaWidth / 2.3,
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: mediaWidth / 2.2,
          height: 50,
          child: CustomDropDown(
            items: [for (int i = 0; i < 60; i++) '$i'],
            hintText: 'Minutes',
            dropWidth: mediaWidth / 2.3,
          ),
        ),
      ],
    );
  }
}