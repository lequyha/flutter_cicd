import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/number_form_widget.dart';

class PrescriptionTotalQuantityFormWidget extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const PrescriptionTotalQuantityFormWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NumberFormWidget(
      initialValue: initialValue,
      labelText: 'Số lượng',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng không để trống số lượng';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
