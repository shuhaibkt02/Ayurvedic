import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/model/patient_detail_model.dart';
import 'package:ayurvedic/data/model/patient_model.dart';
import 'package:ayurvedic/data/model/treatment_model.dart';
import 'package:ayurvedic/data/repo/patient/patient_repo.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController advanceController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();

  List<String> payment = ["Cash", "Card", "UPI"];
  List<String> locations = ["kozhikode", "malappuram", "wayanad"];
  List<BranchModel> branches = [];
  List<TreatmentModel> treatments = [];
  List<PatientDetailModel> createdTreatment = [];
  List<PatientModel> allPatients = [];

  String selectedPay = 'Cash';
  String selectedLocation = '';
  String selectedBranch = '';
  String selectedDate = '';
  String selectedHour = '';
  String selectedMinutes = '';
  String selectedTreatment = '';
  int maleCount = 0;
  int femaleCount = 0;

  void updateCount(bool isMale, bool increment) {
    if (isMale) {
      maleCount += increment ? 1 : -1;
    } else {
      femaleCount += increment ? 1 : -1;
    }
    notifyListeners();
  }

  void changePayment(String? value) {
    selectedPay = value!;
    notifyListeners();
  }

  void selectLocation(String? value) {
    selectedLocation = value!;
    notifyListeners();
  }

  void fetchBranches() async {
    branches = await PatientRepositery().fetchBranches();
    treatments = await PatientRepositery().fetchTreatments();
    allPatients = await PatientRepositery().fetchPatient();
    notifyListeners();
  }

  void selectBranch(String? value) {
    selectedBranch = value!;
    notifyListeners();
  }

  void selectDate(String? value) {
    selectedDate = value!;
    notifyListeners();
  }

  void selectHour(String? value) {
    selectedHour = value!;
    notifyListeners();
  }

  void selectMinute(String? value) {
    selectedMinutes = value!;
    notifyListeners();
  }

  void selectTreatment(String? value) {
    selectedTreatment = value!;
    notifyListeners();
  }

  void createTreatmentAndClear() {
    int id = createdTreatment.length + 1;
    print(maleCount);
    PatientDetailModel patient = PatientDetailModel(
      id: id,
      male: maleCount.toString(),
      female: femaleCount.toString(),
      patient: 0,
      treatment: 0,
      treatmentName: selectedTreatment,
    );
    createdTreatment.add(patient);
    maleCount = 0;
    femaleCount = 0;
    selectedTreatment = '';
    notifyListeners();
  }

  void deleteTreatment({required int id}) {
    createdTreatment.removeAt(id);
  }

  void savePatient() {
    int id = allPatients.last.id + 1;
    String totalString = totalController.text;
    String balanceString = balanceController.text;
    String discountString = discountController.text;
    String advanceString = advanceController.text;
    int total = int.tryParse(totalString)!.toInt();
    int balance = int.tryParse(balanceString)!.toInt();
    int discount = int.tryParse(discountString)!.toInt();
    int adnavce = int.tryParse(advanceString)!.toInt();
    PatientModel patientModel = PatientModel(
      id: id,
      patientDetailList: createdTreatment,
      branch: branches.firstWhere((branch) => branch.name == selectedBranch),
      user: nameController.text.trim(),
      payment: selectedPay,
      name: nameController.text.trim(),
      phone: whatsappController.text.trim(),
      address: addressController.text.trim(),
      price: 0,
      totalAmount: total,
      discountAmount: discount,
      advanceAmount: adnavce,
      balanceAmount: balance,
      dateAndTime: selectedDate,
      isActive: true,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    allPatients.add(patientModel);
    print(patientModel);
  }

  void generatePdf() {}
}
