import 'package:ayurvedic/logic/register_provider.dart';
import 'package:ayurvedic/presentation/widget/login/custom_text.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final RegisterProvider prov;
  const DateWidget({super.key, required this.prov});

  @override
  Widget build(BuildContext context) {
    Future<void> datePicker(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 1, 1),
        lastDate: DateTime(2100),
      );
      String dateIs =
          '${pickedDate?.year}-${pickedDate?.month}-${pickedDate?.day}';
      prov.selectDate(dateIs);
      print(pickedDate);
    }

    return CustomTextField(
      readOnly: true,
      onTap: () {
        datePicker(context);
      },
      hintText: prov.selectedDate,
      suffix: const Icon(
        Icons.calendar_today_outlined,
        color: packageTextColor,
      ),
    );
  }
}
