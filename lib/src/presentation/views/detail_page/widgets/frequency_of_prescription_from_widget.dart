import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

const List<SelectItemModel> frequencyOfPrescription = [
  SelectItemModel(label: 'Hằng ngày', value: 0),
  SelectItemModel(label: 'Ngày cụ thể', value: 1),
  SelectItemModel(label: 'Khoảng thời gian', value: 2),
];

class PrescriptionFrequencyFormWidget extends StatelessWidget {
  final SelectItemModel? initialValue;
  final ValueChanged<SelectItemModel?> onChanged;

  const PrescriptionFrequencyFormWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollSelectFormWidget(
      onChanged: onChanged,
      initialItem: initialValue,
      hideShowBtn: true,
      items: frequencyOfPrescription,
      labelText: 'Tần suất',
      suffixIcon: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: primaryColor,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
