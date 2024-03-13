import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final double? dropWidth;

  final void Function(String?)? onSelected;
  const CustomDropDown({
    super.key,
    required this.items,
    this.onSelected,
    required this.hintText,
    this.dropWidth,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: DropdownMenu<String>(
        width: dropWidth ?? width / 1.09,
        hintText: hintText,
        textStyle: textTheme.bodySmall,
        menuStyle: MenuStyle(
          maximumSize: MaterialStatePropertyAll(Size(width / 1.09, width)),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            gapPadding: 1,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onSelected: onSelected,
        dropdownMenuEntries: items
            .map(
              (item) => DropdownMenuEntry(value: item, label: '$item'),
            )
            .toList(),
      ),
    );
  }
}
