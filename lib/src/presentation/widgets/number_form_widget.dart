import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumberFormWidget extends HookWidget {
  final String? labelText;
  final FormFieldValidator<String?>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final Color? fillColor;
  final ValueChanged<String> onChanged;
  final String? initialValue;

  const NumberFormWidget({
    super.key,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign,
    this.fillColor,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);
    return TextFormWidget(
      labelText: labelText,
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      textAlign: textAlign,
      fillColor: fillColor,
      onChanged: onChanged,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
