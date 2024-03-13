import 'package:ayurvedic/presentation/widget/login/custom_text.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> datePicker(BuildContext context) async {
      // ignore: unused_local_variable
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 1, 1),
        lastDate: DateTime(2100),
      );
    }

    return CustomTextField(
      readOnly: true,
      onTap: () {
        datePicker(context);
      },
      hintText: '',
      suffix: const Icon(
        Icons.calendar_today_outlined,
        color: packageTextColor,
      ),
    );
  }
}
