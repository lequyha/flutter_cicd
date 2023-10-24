import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<SelectItemModel> dosageOfPrescription = [
  SelectItemModel(label: '1 lần/ ngày', value: 1),
  SelectItemModel(label: '2 lần/ ngày', value: 2),
  SelectItemModel(label: '3 lần/ ngày', value: 3),
  SelectItemModel(label: '4 lần/ ngày', value: 4),
  SelectItemModel(label: '5 lần/ ngày', value: 5),
  SelectItemModel(label: '6 lần/ ngày', value: 6),
  // SelectItemModel(label: 'Tùy chỉnh', value: 0),
];

class DosageDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          current is DetailStateTyping &&
          previous is DetailStateTyping &&
          current.dosage != previous.dosage,
      builder: (context, state) {
        return ScrollSelectFormWidget(
          key: Key('detailForm_dosageDropDown_selectField'),
          initialItem: state is DetailStateTyping ? state.dosage : null,
          onChanged: (value) =>
              context.read<DetailBloc>().add(ChangedDosage(dosage: value)),
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
      },
    );
  }
}
