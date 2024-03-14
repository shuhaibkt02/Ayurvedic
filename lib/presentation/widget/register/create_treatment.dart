import 'package:ayurvedic/logic/register_provider.dart';
import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_textfield.dart';
import 'package:ayurvedic/presentation/widget/register/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CreateTreatmentCard extends StatelessWidget {
  final RegisterProvider prov;
  const CreateTreatmentCard({
    super.key,
    required this.prov,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 5),
            CustomFormField(
              label: 'Choose Treatment',
              child: CustomDropDown(
                  onSelected: (treatment) => prov.selectTreatment(treatment),
                  items: prov.treatments.map((e) => e.name).toList(),
                  hintText: 'Choose prefered treatment'),
            ),
            CustomFormField(
              label: 'Add Patients',
              child: Column(
                children: [
                  _GenderBox(
                    gender: 'Male',
                    valueIn: prov.maleCount,
                    prov: prov,
                    increament: () {
                      prov.updateCount(true, true);
                      print(prov.maleCount);
                    },
                    decreament: () {
                      prov.updateCount(true, false);
                    },
                  ),
                  const SizedBox(height: 8),
                  _GenderBox(
                    gender: 'Female',
                    valueIn: prov.femaleCount,
                    prov: prov,
                    increament: () {
                      prov.updateCount(false, true);
                    },
                    decreament: () {
                      prov.updateCount(false, false);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
                onPress: () {
                  prov.createTreatmentAndClear();
                  Navigator.pop(context);
                },
                buttonLabel: 'Save')
          ],
        ),
      ),
    );
  }
}

class _GenderBox extends StatelessWidget {
  final String gender;
  final VoidCallback increament;
  final VoidCallback decreament;
  final RegisterProvider prov;
  final int valueIn;
  const _GenderBox(
      {required this.gender,
      required this.valueIn,
      required this.prov,
      required this.increament,
      required this.decreament});

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
                    onPressed: decreament,
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.keyboard_arrow_left_rounded,
                        size: 15)),
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
                    onPressed: increament,
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
