import 'package:ayurvedic/data/model/controller_model.dart';
import 'package:ayurvedic/logic/register_provider.dart';
import 'package:ayurvedic/presentation/widget/home/app_bar.dart';
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
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: const RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegisterProvider>(context);
    prov.fetchBranches();
    final textTheme = Theme.of(context).textTheme;

    List<String> options = ['Name', "Whatsapp Number", "Address"];

    List<ControllerModel> amountCnt = [
      ControllerModel(label: 'Total Amount', controller: prov.totalController),
      ControllerModel(
          label: 'Discount Amount', controller: prov.discountController),
      ControllerModel(label: 'Payment Option'),
      ControllerModel(
          label: 'Advance Amount', controller: prov.advanceController),
      ControllerModel(
          label: 'Balance Amount', controller: prov.balanceController),
    ];
    List<TextEditingController> basicControllers = [
      prov.nameController,
      prov.whatsappController,
      prov.addressController
    ];

    return Scaffold(
      appBar: appBar(textTheme: textTheme, title: 'Register'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            ...List.generate(
              options.length,
              (index) => options[index].contains('Whatsapp')
                  ? CustomFormField(
                      controller: basicControllers[index],
                      label: options[index],
                      hintText: 'Enter your  ${options[index]}',
                      keyboardType: TextInputType.phone,
                    )
                  : CustomFormField(
                      controller: basicControllers[index],
                      label: options[index],
                      hintText: 'Enter your full ${options[index]}'),
            ),
            CustomFormField(
              label: 'Location',
              child: CustomDropDown(
                onSelected: (location) {
                  prov.selectLocation(location);
                },
                items: prov.locations,
                hintText: 'Choose your location',
              ),
            ),
            CustomFormField(
              label: 'Branch',
              child: CustomDropDown(
                onSelected: (branch) {
                  prov.selectBranch(branch);
                },
                items: prov.branches.map((e) => e.name).toList(),
                hintText: 'select your branch',
              ),
            ),
            CustomFormField(
              label: 'Treatments',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(prov.createdTreatment.length, (index) {
                    final treatment = prov.createdTreatment[index];
                    return TreatmentCard(
                      indexOfCard: index,
                      packageName: treatment.treatmentName,
                      maleCount: int.parse(treatment.male),
                      femaleCount: int.parse(treatment.female),
                      onEdit: () {},
                      onDelete: () {
                        prov.deleteTreatment(id: index);
                      },
                    );
                  }),
                  CustomButton(
                    btnColor: treatmentColor,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CreateTreatmentCard(
                          prov: prov,
                        ),
                      );
                    },
                    buttonLabel: 'Add Treatment',
                  ),
                ],
              ),
            ),
            ...List.generate(
                amountCnt.length,
                (index) => amountCnt[index].label.contains('Payment')
                    ? CustomFormField(
                        label: amountCnt[index].label,
                        child: const OptionRadio(),
                      )
                    : CustomFormField(
                        label: amountCnt[index].label,
                        keyboardType: TextInputType.number,
                        controller: amountCnt[index].controller,
                      )),
            CustomFormField(
              label: 'Treatment Date',
              child: DateWidget(
                prov: prov,
              ),
            ),
            CustomFormField(
              label: 'Treatment Time',
              child: TimePicker(
                prov: prov,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
                onPress: () {
                  prov.savePatient();
                  prov.generatePdf();
                },
                buttonLabel: 'Save'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
