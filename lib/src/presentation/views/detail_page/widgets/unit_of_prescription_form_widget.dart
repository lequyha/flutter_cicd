import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

const List<SelectItemModel> unitsOfPrescription = [
  SelectItemModel(label: 'Viên', value: 0),
  SelectItemModel(label: 'Gói', value: 1),
];

class PrescriptionUnitFormWidget extends StatelessWidget {
  final SelectItemModel? initialValue;
  final ValueChanged<SelectItemModel?> onChanged;

  const PrescriptionUnitFormWidget({
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
      items: unitsOfPrescription,
      labelText: 'Đơn vị',
      suffixIcon: const Icon(Icons.keyboard_arrow_down),
      textAlign: TextAlign.center,
    );
  }
}
