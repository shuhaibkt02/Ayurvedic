import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/model/patient_detail_model.dart';
import 'package:ayurvedic/data/model/patient_model.dart';
import 'package:ayurvedic/data/model/treatment_model.dart';
import 'package:ayurvedic/data/repo/patient/patient_repo.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
  BranchModel? selectedBranchData;
  List<TreatmentModel> treatments = [];
  List<PatientDetailModel> createdTreatment = [];
  List<PatientDetailModel> fetchTreatment = [];
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
    selectedBranchData =
        branches.firstWhere((element) => element.name.isNotEmpty);

    notifyListeners();
  }

  void selectBranch(String? value) {
    selectedBranch = value!;
    selectedBranchData =
        branches.firstWhere((element) => element.name == value);
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

  Future generatePdf() async {
    final pdf = pw.Document();
    final List<String> headerNames = [
      'Treatment',
      'Price',
      'Male',
      'Female',
      'Total',
    ];

    final coverLogo = pw.MemoryImage(
      (await rootBundle.load('assets/images/big.png')).buffer.asUint8List(),
    );

    final logo = pw.MemoryImage(
        (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List());
    final sign = pw.MemoryImage(
        (await rootBundle.load('assets/images/sign.png')).buffer.asUint8List());
    PdfColor pdfMainGreen = PdfColor.fromInt(packageTextColor.value);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(children: [
            pw.Container(
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: coverLogo,
                  fit: pw.BoxFit.contain,
                ),
              ),
            ),
            pw.Container(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(logo, width: 76, height: 80),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text(selectedBranchData!.name,
                                textAlign: pw.TextAlign.end,
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(selectedBranchData!.address),
                            pw.Text("e-mail: ${selectedBranchData!.mail}"),
                            pw.Text("Mob: ${selectedBranchData!.phone}"),
                            pw.Text("GST No: ${selectedBranchData!.gst}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Divider(
                      color: PdfColors.grey.shade(0.2),
                      height: 2,
                      thickness: 1),
                  pw.SizedBox(height: 18),
                  pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text("Patient Details",
                        style: pw.TextStyle(
                            color: pdfMainGreen,
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.SizedBox(height: 18),
                  pw.Row(
                    children: [
                      pw.Flexible(
                        fit: pw.FlexFit.tight,
                        child: pw.Container(
                            child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Name",
                                textAlign: pw.TextAlign.start,
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text("Address",
                                textAlign: pw.TextAlign.start,
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text("WhatsApp Number",
                                textAlign: pw.TextAlign.start,
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        )),
                      ),
                      pw.Container(
                        width: 200,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Salih T",
                                textAlign: pw.TextAlign.start,
                                style: const pw.TextStyle(fontSize: 10)),
                            pw.Text("Nadakkave, Kozhikkode",
                                textAlign: pw.TextAlign.start,
                                style: const pw.TextStyle(fontSize: 10)),
                            pw.Text("+91 987654321",
                                textAlign: pw.TextAlign.start,
                                style: const pw.TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      pw.Flexible(
                          fit: pw.FlexFit.tight,
                          child: pw.Container(
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Booked On",
                                    textAlign: pw.TextAlign.start,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text("Treatment Date",
                                    textAlign: pw.TextAlign.start,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text("Treatment Time ",
                                    textAlign: pw.TextAlign.start,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold)),
                              ],
                            ),
                          )),
                      pw.Flexible(
                        fit: pw.FlexFit.tight,
                        child: pw.Container(
                            width: 200,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("31/01/2024",
                                      textAlign: pw.TextAlign.start,
                                      style: const pw.TextStyle(fontSize: 10)),
                                  pw.Text("21/02/2024",
                                      textAlign: pw.TextAlign.start,
                                      style: const pw.TextStyle(fontSize: 10)),
                                  pw.Text("11:00 am",
                                      textAlign: pw.TextAlign.start,
                                      style: const pw.TextStyle(fontSize: 10)),
                                ])),
                      )
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    height: 1,
                    child: pw.Row(
                      children: List.generate(
                        30,
                        (index) => pw.Container(
                          width: 14,
                          height: .2,
                          margin: const pw.EdgeInsets.symmetric(horizontal: 1),
                          color: PdfColors.grey,
                        ),
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Table(children: [
                    buildHeaderRow(headerNames),
                    for (var treatment in createdTreatment)
                      pw.TableRow(children: [
                        pw.Text(treatment.treatmentName),
                        pw.Container(width: 50, child: pw.Text("0")),
                        pw.Text(treatment.male.toString()),
                        pw.Text(treatment.female.toString()),
                        pw.Text("0"),
                      ]),
                  ]),
                  pw.SizedBox(height: 155),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Total Amount",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("10",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Discount",
                            textAlign: pw.TextAlign.start,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text("150",
                            textAlign: pw.TextAlign.start,
                            style: const pw.TextStyle(fontSize: 10)),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Advance  ",
                            textAlign: pw.TextAlign.start,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text("50",
                            textAlign: pw.TextAlign.start,
                            style: const pw.TextStyle(fontSize: 10)),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Container(
                            height: 1,
                            child: pw.Row(
                              children: List.generate(
                                  5,
                                  (index) => pw.Container(
                                        width: 14,
                                        height: .2,
                                        margin: const pw.EdgeInsets.symmetric(
                                            horizontal: 1),
                                        color: PdfColors.grey,
                                      )),
                            )),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Balance",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text(allPatients.first.balanceAmount.toString(),
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Thank you for choosing us",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 16,
                                fontWeight: pw.FontWeight.bold,
                                color: pdfMainGreen)),
                      ]),
                  pw.Text(
                      "Your well-being is our commitment, and we're honored \n you've entrusted us with your health journey",
                      textAlign: pw.TextAlign.end,
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.normal,
                        color: PdfColors.grey,
                      )),
                  pw.Image(sign, width: 76, height: 80),
                  pw.Spacer(),
                  pw.Container(
                    height: 1,
                    child: pw.Row(
                      children: List.generate(
                        30,
                        (index) => pw.Container(
                          width: 14,
                          height: .2,
                          margin: const pw.EdgeInsets.symmetric(horizontal: 1),
                          color: PdfColors.grey,
                        ),
                      ),
                    ),
                  ),
                  pw.Text(
                      "“Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment”",
                      textAlign: pw.TextAlign.end,
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.normal,
                        color: PdfColors.grey,
                      )),
                ],
              ),
            ),
          ]);
        },
      ),
    );
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/Invoice2.pdf");
    print('file :$file');
    return await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  pw.TableRow buildHeaderRow(List<String> headerNames) {
    return pw.TableRow(
      children: headerNames.map(
        (header) {
          return pw.Text(
            header,
            style: const pw.TextStyle(),
          );
        },
      ).toList(),
    );
  }
}
