import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_textfield.dart';
import 'package:ayurvedic/presentation/widget/register/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CreateTreatmentCard extends StatelessWidget {
  const CreateTreatmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CustomFormField(
              label: 'Choose Treatment',
              child: CustomDropDown(
                  items: [], hintText: 'Choose prefered treatment'),
            ),
            const CustomFormField(
              label: 'Add Patients',
              child: Column(
                children: [
                  _GenderBox(
                    gender: 'Male',
                    valueIn: 1,
                  ),
                  SizedBox(height: 8),
                  _GenderBox(
                    gender: 'Female',
                    valueIn: 2,
                  ),
                ],
              ),
            ),
            CustomButton(onPress: () {}, buttonLabel: 'Save')
          ],
        ),
      ),
    );
  }
}

class _GenderBox extends StatelessWidget {
  final String gender;
  final int valueIn;
  const _GenderBox({required this.gender, required this.valueIn});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Center(
              child: Text(gender, textAlign: TextAlign.start),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.add, size: 15)),
                SizedBox(
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text('$valueIn'),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.add, size: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
