import 'package:ayurvedic/utils/constant.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String patientName;
  final int patientOp;
  final String date;
  final String withWho;
  final String packageName;
  const PatientCard({
    super.key,
    required this.patientName,
    required this.date,
    required this.withWho,
    required this.packageName,
    required this.patientOp,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Colors.grey.shade50,
          child: Column(
            children: [
              _details(
                  width: width,
                  patientOp: patientOp,
                  patientName: patientName,
                  textTheme: textTheme,
                  packageName: packageName,
                  date: date,
                  withWho: withWho),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SizedBox(width: width / 6),
                    Text(
                      'View Booking details',
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: width / 5.5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _details extends StatelessWidget {
  const _details({
    required this.width,
    required this.patientOp,
    required this.patientName,
    required this.textTheme,
    required this.packageName,
    required this.date,
    required this.withWho,
  });

  final double width;
  final int patientOp;
  final String patientName;
  final TextTheme textTheme;
  final String packageName;
  final String date;
  final String withWho;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10),
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            child: Text(' $patientOp.'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientName,
                style: textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              Text(
                packageName,
                style: textTheme.bodyMedium?.copyWith(
                    color: packageTextColor, fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  _IconWithText(
                    icon: Icons.calendar_today_outlined,
                    content: date,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 10),
                  _IconWithText(
                    icon: Icons.people_outline,
                    content: withWho,
                    textTheme: textTheme,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  final IconData icon;
  final String content;
  final TextTheme textTheme;
  const _IconWithText(
      {required this.icon, required this.content, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            content,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
