import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

const List<SelectItemModel> dosageOfPrescription = [
  SelectItemModel(label: '1 lần/ ngày', value: 1),
  SelectItemModel(label: '2 lần/ ngày', value: 2),
  SelectItemModel(label: '3 lần/ ngày', value: 3),
  SelectItemModel(label: '4 lần/ ngày', value: 4),
  SelectItemModel(label: '5 lần/ ngày', value: 5),
  SelectItemModel(label: '6 lần/ ngày', value: 6),
  // SelectItemModel(label: 'Tùy chỉnh', value: 0),
];

class PrescriptionDosageFormWidget extends StatelessWidget {
  final SelectItemModel? initialValue;
  final ValueChanged<SelectItemModel?> onChanged;

  const PrescriptionDosageFormWidget({
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
      items: dosageOfPrescription,
      labelText: 'Thời gian và liều lượng',
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