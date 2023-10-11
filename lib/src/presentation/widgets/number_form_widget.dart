import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumberFormWidget extends HookWidget {
  final String? labelText;
  final FormFieldValidator<String?>? validator;

  const NumberFormWidget({
    super.key,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return TextFormWidget(
      labelText: labelText,
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
