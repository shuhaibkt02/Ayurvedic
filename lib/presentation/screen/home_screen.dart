import 'package:ayurvedic/presentation/widget/home/patient_card.dart';
import 'package:ayurvedic/presentation/widget/home/search_bar.dart';
import 'package:ayurvedic/presentation/widget/home/sort_by_widget.dart';
import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
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
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(onTap: () {}),
            const SortBy(),
            const Divider(),
            ...List.generate(
              5,
              (index) => PatientCard(
                patientName: 'Vikram Singh',
                date: '31/01/2024',
                withWho: 'Jithesh',
                packageName: 'Couple Combo Package(Rejuven)',
                patientOp: index + 1,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        onPress: () {},
        buttonLabel: 'Register Now',
      ),
    );
  }
}
