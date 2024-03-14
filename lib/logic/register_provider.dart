import 'package:ayurvedic/data/model/branches_model.dart';
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

  String selectedPay = 'Cash';
  String selectedLocation = '';
  String selectedBranch = '';
  String selectedDate = '';
  String selectedHour = '';
  String selectedMinutes = '';

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

  void generatePdf({required String name,required String }){
                      String name = prov.nameController.text.trim();
                  String whatsapp = prov.whatsappController.text.trim();
                  String address = prov.addressController.text.trim();
                  String totalAmount = prov.totalController.text.trim();
                  String discountAmount = prov.discountController.text.trim();
                  String advanceAmount = prov.advanceController.text.trim();
                  String balanceAmount = prov.balanceController.text.trim();

                  String location = prov.selectedLocation;
                  String selectedBranch = prov.selectedBranch;
                  String selectedPayment = prov.selectedPay;
                  String selectedDate = prov.selectedDate;
                  print(
                      '$name $whatsapp $address $totalAmount $discountAmount $discountAmount,$advanceAmount $balanceAmount $location $selectedPayment $selectedDate $selectedBranch');

  }
}
