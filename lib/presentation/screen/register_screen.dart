import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:ayurvedic/presentation/widget/login/custom_textfield.dart';
import 'package:ayurvedic/presentation/widget/register/create_treatment.dart';
import 'package:ayurvedic/presentation/widget/register/custom_dropdown.dart';
import 'package:ayurvedic/presentation/widget/register/date_widget.dart';
import 'package:ayurvedic/presentation/widget/register/option_radio.dart';
import 'package:ayurvedic/presentation/widget/register/time_picker_widget.dart';
import 'package:ayurvedic/presentation/widget/register/treatment_card.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController whatsappController = TextEditingController();
    // final TextEditingController addressController = TextEditingController();
    // final TextEditingController totalController = TextEditingController();
    // final TextEditingController discountController = TextEditingController();
    // final TextEditingController advanceController = TextEditingController();
    // final TextEditingController balanceController = TextEditingController();

    AppBar appBar() => AppBar(
          elevation: 1,
          title: Text(
            'Register',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {},
                icon: const Badge(
                  isLabelVisible: true,
                  child: Icon(Icons.notifications_none),
                ),
              ),
            )
          ],
        );
    List<String> options = ['Name', "Whatsapp Number", "Address"];

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            ...options.map(
              (title) => title.contains('Whatsapp')
                  ? CustomFormField(
                      label: title,
                      hintText: 'Enter your  $title',
                      keyboardType: TextInputType.phone,
                    )
                  : CustomFormField(
                      label: title, hintText: 'Enter your full $title'),
            ),
            CustomFormField(
              label: 'Location',
              child: CustomDropDown(
                onSelected: (p0) {},
                items: const [],
                hintText: 'Choose your location',
              ),
            ),
            CustomFormField(
              label: 'Branch',
              child: CustomDropDown(
                onSelected: (p0) {},
                items: const [],
                hintText: 'select your branch',
              ),
            ),
            CustomFormField(
              label: 'Treatments',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...["ok"].map(
                    (e) => TreatmentCard(
                      indexOfCard: 1,
                      packageName: 'Couple Combo package',
                      maleCount: 1,
                      femaleCount: 1,
                      onEdit: () {},
                      onDelete: () {},
                    ),
                  ),
                  CustomButton(
                    btnColor: treatmentColor,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const CreateTreatmentCard(),
                      );
                    },
                    buttonLabel: 'Add Treatment',
                  ),
                ],
              ),
            ),
            ...[
              "Total Amount",
              "Discount Amount",
              "Payment Option",
              "Advance Amount",
              "Balance Amount"
            ].map(
              (title) => title.contains('Payment')
                  ? CustomFormField(
                      label: title,
                      child: const OptionRadio(),
                    )
                  : CustomFormField(
                      label: title,
                      keyboardType: TextInputType.number,
                    ),
            ),
            const CustomFormField(
              label: 'Treatment Date',
              child: DateWidget(),
            ),
            const CustomFormField(
              label: 'Treatment Time',
              child: TimePicker(),
            ),
            const SizedBox(height: 20),
            CustomButton(onPress: () {}, buttonLabel: 'Save'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
