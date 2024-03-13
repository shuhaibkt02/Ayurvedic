import 'package:flutter/material.dart';

class SortBy extends StatelessWidget {
  const SortBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sort by:'),
          DropdownMenu(
            width: width / 1.95,
            hintText: 'Date',
            textStyle: textTheme.bodySmall,
            menuStyle: const MenuStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(18)),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                gapPadding: 1,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onSelected: (value) {},
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2')
            ],
          ),
        ],
      ),
    );
  }
}
