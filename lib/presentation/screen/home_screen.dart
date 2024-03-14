import 'package:ayurvedic/logic/patient/patient_bloc.dart';
import 'package:ayurvedic/presentation/screen/register_screen.dart';
import 'package:ayurvedic/presentation/widget/home/app_bar.dart';
import 'package:ayurvedic/presentation/widget/home/patient_card.dart';
import 'package:ayurvedic/presentation/widget/home/custom_search_bar.dart';
import 'package:ayurvedic/presentation/widget/home/sort_by_widget.dart';
import 'package:ayurvedic/presentation/widget/login/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          CustomSearchBar(onTap: () {}),
          const SortBy(),
          const Divider(),
          BlocBuilder<PatientBloc, PatientState>(
            builder: (context, state) {
              if (state is PatientError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is PatientInitial) {
                context.read<PatientBloc>().add(LoadPateient());
                print('init');
                return Column(
                  children: List.generate(
                    1,
                    (index) => PatientCard(
                      patientName: 'Vikram Singh',
                      date: '31/01/2024',
                      withWho: 'Jithesh',
                      packageName: 'Couple Combo Package(Rejuven)',
                      patientOp: index + 1,
                    ),
                  ),
                );
              }
              if (state is PatientLoaded) {
                print('load');
                final patientData = state.patientData;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<PatientBloc>().add(LoadPateient());
                    },
                    child: ListView.builder(
                      itemCount: patientData.length - 90,
                      itemBuilder: (context, itemIndex) {
                        var patient = patientData[itemIndex];
                        return PatientCard(
                          patientName: patient.name,
                          date: patient.dateAndTime,
                          withWho: patient.user,
                          packageName:
                              patient.patientDetailList.first.treatmentName,
                          patientOp: itemIndex + 1,
                        );
                      },
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        onPress: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ));
        },
        buttonLabel: 'Register Now',
      ),
    );
  }
}
