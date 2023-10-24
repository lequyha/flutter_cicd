import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/scroll_select_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<SelectItemModel> frequencyOfPrescription = [
  SelectItemModel(label: 'Hằng ngày', value: 0),
  SelectItemModel(label: 'Ngày cụ thể', value: 1),
  SelectItemModel(label: 'Khoảng thời gian', value: 2),
];

class FrequencyDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          current is DetailStateTyping &&
          previous is DetailStateTyping &&
          current.frequency != previous.frequency,
      builder: (context, state) {
        return ScrollSelectFormWidget(
          key: Key('detailForm_frequencyDropDown_selectField'),
          onChanged: (value) => context
              .read<DetailBloc>()
              .add(ChangedFrequency(frequency: value)),
          initialItem: state is DetailStateTyping ? state.frequency : null,
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
      },
    );
  }
}
