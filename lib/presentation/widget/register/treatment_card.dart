import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final int maleCount;
  final int femaleCount;
  final String packageName;
  final int indexOfCard;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const TreatmentCard({
    super.key,
    required this.indexOfCard,
    required this.packageName,
    required this.maleCount,
    required this.femaleCount,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: SizedBox(
          height: 90,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('$indexOfCard.'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          packageName,
                          style: textTheme.bodyMedium?.copyWith(fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: onDelete,
                          child: Icon(
                            Icons.close,
                            color: Colors.red.shade600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _GenderBox(
                          gender: 'Male',
                          textTheme: textTheme,
                          value: 1,
                        ),
                        const SizedBox(width: 10),
                        _GenderBox(
                          gender: 'Female',
                          textTheme: textTheme,
                          value: 2,
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: onEdit,
                          child: const Icon(Icons.edit, size: 18),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GenderBox extends StatelessWidget {
  final String gender;
  final int value;
  final TextTheme textTheme;
  const _GenderBox({
    required this.gender,
    required this.textTheme,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          gender,
          style: textTheme.bodyMedium?.copyWith(color: packageTextColor),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 50,
          height: 35,
          child: TextField(
            readOnly: true,
            style: textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: '   $value',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              enabled: false,
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        )
      ],
    );
  }
}
