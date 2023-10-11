import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

class UnitFormWidget extends StatelessWidget {
  const UnitFormWidget({super.key});

  static const List<SelectItemModel> items = [
    SelectItemModel(label: 'Viên', value: 0),
    SelectItemModel(label: 'Gói', value: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollSelectFormWidget(
      onChanged: (value) {},
      initialItem: items.isNotEmpty ? items.first : null,
      hideShowBtn: true,
      items: items,
      labelText: 'Đơn vị',
      suffixIcon: const Icon(Icons.keyboard_arrow_down),
      textAlign: TextAlign.center,
    );
  }
}