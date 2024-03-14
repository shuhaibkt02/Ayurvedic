import 'dart:io';

import 'package:flutter/services.dart';
import 'package:ink/ink.dart';
import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/presentation/screen/details_screen.dart';
import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

// import 'package:ayurvedic/utils/constant.dart';

BranchModel model = const BranchModel(
    id: 1,
    name: 'KUMARAKOM',
    patientsCount: 12,
    location: 'location',
    phone: '91 9876543210 | +91 9786543210',
    mail: 'unknown@gmail.com',
    address: 'Cheepunkal P.O. Kumarakom, kottayam, Kerala - 68656',
    gst: '32AABCU9603R1ZW',
    isActive: true);

Future<Uint8List> loadAsset(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List();
}

Future<bool> generatePdf(BranchModel branch) async {
  final pdf = Document();
  final Uint8List logo = await loadAsset('assets/images/logo.png');
  final Uint8List sign = await loadAsset('assets/images/sign.png');
  final black = PdfColor.fromInt(const Color(0xFF000000).value);
  final grey = PdfColor.fromInt(const Color(0xFF9A9A9A).value);
  final greylight = PdfColor.fromInt(const Color(0xFF737373).value);
  final dividerColor = PdfColor.fromInt(const Color(0xFFCBCBCB).value);
  final green = PdfColor.fromInt(const Color(0xFF00A64F).value);

  final styleHead = pw.TextStyle(fontSize: 18, color: grey);
  final styleMedium = pw.TextStyle(fontSize: 16, color: grey);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Padding(
          padding: pw.EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: pw.Column(
            children: [
              // top
              // row [ logo - branch]
              pw.SizedBox(
                height: 120,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    // logo
                    pw.Expanded(
                      child: pw.Image(pw.MemoryImage(logo)),
                    ),
                    // branch
                    pw.Expanded(
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 0.0),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text(
                              branch.name,
                              style: pw.TextStyle(fontSize: 18, color: black),
                            ),
                            pw.Text(
                              branch.address,
                              style: styleMedium,
                            ),
                            pw.Text(
                              'e-mail: ${branch.mail}',
                              style: styleMedium,
                            ),
                            pw.Text(
                              'Mob: ${branch.phone}',
                              style: styleMedium,
                            ),
                            pw.Text(
                              'GST No: ${branch.gst}',
                              style: pw.TextStyle(fontSize: 18, color: black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.Divider(color: black),
              // Patient Details
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Container(
                      height: 70,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          // detail name
                          pw.Text(
                            'Patient Details',
                            style: pw.TextStyle(color: green, fontSize: 16),
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Container(
                                    color: green, height: 60, width: 150),
                              ),
                              pw.SizedBox(width: 10),
                              pw.Expanded(
                                child: pw.Container(
                                    color: green, height: 60, width: 150),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Container(
                      color: greylight,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String documentPath = documentDirectory.path;
  print('$documentPath +');
  File file = File("$documentPath/Invoice2.pdf");
  return await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}








