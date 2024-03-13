import 'package:flutter/material.dart';

class OptionRadio extends StatelessWidget {
  const OptionRadio({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedindex = 'Cash';

    List<String> payment = ["Cash", "Card", "UPI"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          payment.length,
          (index) => Row(
            children: [
              Radio<String>(
                value: payment[index],
                groupValue: selectedindex,
                onChanged: (value) {},
              ),
              Text(payment[index]),
            ],
          ),
        ),
      ),
    );
  }
}
