import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/time_form_widget.dart';

class PresctiptionTimeFormWidget extends StatelessWidget {
  const PresctiptionTimeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TimeFormWidget(
      onChanged: (dateTime) {},
      textAlign: TextAlign.center,
      prefixIcon: const Icon(Icons.schedule),
    );
  }
}
