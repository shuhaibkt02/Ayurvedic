import 'package:ayurvedic/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionRadio extends StatelessWidget {
  const OptionRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final provd = Provider.of<RegisterProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          provd.payment.length,
          (index) => Row(
            children: [
              Radio<String>(
                value: provd.payment[index],
                groupValue: provd.selectedPay,
                onChanged: (value) {
                  provd.changePayment(value);
                },
              ),
              Text(provd.payment[index]),
            ],
          ),
        ),
      ),
    );
  }
}
