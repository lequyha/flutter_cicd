import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';

class DosageFormWidget extends StatelessWidget {
  const DosageFormWidget({super.key});

  static const List<SelectItemModel> items = [
    SelectItemModel(label: '1 lần/ ngày', value: 1),
    SelectItemModel(label: '2 lần/ ngày', value: 2),
    SelectItemModel(label: '3 lần/ ngày', value: 3),
    SelectItemModel(label: '4 lần/ ngày', value: 4),
    SelectItemModel(label: '5 lần/ ngày', value: 5),
    SelectItemModel(label: '6 lần/ ngày', value: 6),
    SelectItemModel(label: 'Tùy chỉnh', value: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollSelectFormWidget(
      onChanged: (value) {},
      initialItem: items.isNotEmpty ? items.first : null,
      hideShowBtn: true,
      items: items,
      labelText: 'Thời gian và liều lượng',
      fillColor: const Color(0xffF8F8F6),
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
