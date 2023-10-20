import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

const List<SelectItemModel> quantityOfPrescription = [
  SelectItemModel(label: '1', value: 1),
  SelectItemModel(label: '2', value: 2),
  SelectItemModel(label: '3', value: 3),
  SelectItemModel(label: '4', value: 4),
  SelectItemModel(label: '5', value: 5),
  SelectItemModel(label: '6', value: 6),
  // SelectItemModel(label: 'Tùy chỉnh', value: 0),
];

class QuantityAndUnitPrescriptionFormWidget extends StatelessWidget {
  final SelectItemModel? initialValue;
  final ValueChanged<SelectItemModel?> onChanged;
  final String? unitLable;

  const QuantityAndUnitPrescriptionFormWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.unitLable,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollSelectFormWidget(
      onChanged: onChanged,
      initialItem: initialValue,
      hideShowBtn: true,
      items: quantityOfPrescription,
      textAlign: TextAlign.center,
      suffixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
        child: Text(unitLable ?? ''),
      ),
    );
  }
}
