import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/autocomplete_form_widget.dart';

class PrescriptionNameFormWidget extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const PrescriptionNameFormWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AutoCompleteFormWidget(
      labelText: 'Tên thuốc',
      initialValue: initialValue,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng không để trống tên thuốc';
        }
        return null;
      },
    );
  }
}
