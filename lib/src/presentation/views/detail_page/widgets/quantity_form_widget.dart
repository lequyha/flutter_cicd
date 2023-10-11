import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

class QuantityFormWidget extends StatelessWidget {
  const QuantityFormWidget({super.key});

  static const List<SelectItemModel> items = [
    SelectItemModel(label: '1', value: 1),
    SelectItemModel(label: '2', value: 2),
    SelectItemModel(label: '3', value: 3),
    SelectItemModel(label: '4', value: 4),
    SelectItemModel(label: '5', value: 5),
    SelectItemModel(label: '6', value: 6),
    SelectItemModel(label: 'Tùy chỉnh', value: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollSelectFormWidget(
      onChanged: (value) {},
      initialItem: items.isNotEmpty ? items.first : null,
      hideShowBtn: true,
      items: items,
      textAlign: TextAlign.center,
      fillColor: const Color(0xffF8F8F6),
      suffixIcon: const Padding(
        padding: EdgeInsets.fromLTRB(12, 16, 16, 12),
        child: Text('Viên'),
      ),
    );
  }
}
