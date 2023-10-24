import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/number_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalQuantityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          current is DetailStateTyping &&
          previous is DetailStateTyping &&
          current.quantity != previous.quantity,
      builder: (context, state) {
        return NumberFormWidget(
          key: Key('detailForm_totalQuantityInput_textField'),
          initialValue: state is DetailStateTyping
              ? state.quantity?.toString() ?? ''
              : null,
          labelText: 'Số lượng',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng không để trống số lượng';
            }
            return null;
          },
          onChanged: (value) => context
              .read<DetailBloc>()
              .add(ChangedTotalQuantity(quantity: int.tryParse(value))),
        );
      },
    );
  }
}
