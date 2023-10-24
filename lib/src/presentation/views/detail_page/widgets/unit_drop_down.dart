import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<SelectItemModel> unitsOfPrescription = [
  SelectItemModel(label: 'Viên', value: 0),
  SelectItemModel(label: 'Gói', value: 1),
];

class UnitDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          current is DetailStateTyping &&
          previous is DetailStateTyping &&
          current.unit != previous.unit,
      builder: (context, state) {
        return ScrollSelectFormWidget(
          key: Key('detailForm_unitDropDown_selectField'),
          onChanged: (value) =>
              context.read<DetailBloc>().add(ChangedUnit(unit: value)),
          initialItem: state is DetailStateTyping ? state.unit : null,
          hideShowBtn: true,
          items: unitsOfPrescription,
          labelText: 'Đơn vị',
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
