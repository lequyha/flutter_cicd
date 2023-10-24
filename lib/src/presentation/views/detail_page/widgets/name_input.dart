import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/autocomplete_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          current is DetailStateTyping &&
          previous is DetailStateTyping &&
          current.name != previous.name,
      builder: (context, state) {
        return AutoCompleteFormWidget(
          labelText: 'Tên thuốc',
          key: Key('detailForm_nameInput_textField'),
          initialValue: state is DetailStateTyping ? state.name : null,
          onChanged: (value) =>
              context.read<DetailBloc>().add(ChangedName(name: value)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng không để trống tên thuốc';
            }
            return null;
          },
        );
      },
    );
  }
}
