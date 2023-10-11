import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/select_form_widget.dart';

class UnitSelectFormWidget extends StatelessWidget {
  const UnitSelectFormWidget({super.key});

  static const List<SelectItemModel> items = [
    SelectItemModel(label: 'Viên', value: 0),
    SelectItemModel(label: 'Gói', value: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFormWidget(
      onChanged: (value) {},
      initialItem: items.isNotEmpty ? items.first : null,
      hideShowBtn: true,
      items: items,
      labelText: 'Đơn vị',
    );
  }
}
