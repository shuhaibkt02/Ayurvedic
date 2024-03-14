import 'package:ayurvedic/data/model/branches_model.dart';
import 'package:ayurvedic/data/repo/patient/patient_repo.dart';
import 'package:ayurvedic/logic/pdf_generator.dart';
import 'package:ayurvedic/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TopArea(model: model),
        ],
      ),
    ));
  }
}

class TopArea extends StatelessWidget {
  const TopArea({
    super.key,
    required this.model,
  });

  final BranchModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SvgPicture.asset('assets/logo.svg'),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: BranchDetails(branch: model),
        )
      ],
    );
  }
}

class BranchDetails extends StatelessWidget {
  final BranchModel branch;
  const BranchDetails({
    super.key,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            branch.name,
            style: textTheme.bodyMedium?.copyWith(fontSize: 24),
          ),
          Text(
            branch.address,
            style: textTheme.bodySmall?.copyWith(fontSize: 22),
          ),
          Text(
            'e-mail: ${branch.mail}',
            style: textTheme.bodySmall?.copyWith(fontSize: 22),
          ),
          Text(
            'Mob: ${branch.phone}',
            style: textTheme.bodySmall?.copyWith(fontSize: 22),
          ),
          Text(
            'GST No: ${branch.gst}',
            style: textTheme.bodySmall?.copyWith(fontSize: 22),
          ),
          InkWell(
            onTap: () {
              generatePdf(model);
            },
            child: Text('Okay'),
          )
        ],
      ),
    );
  }
}
