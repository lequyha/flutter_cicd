import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const double _kItemExtent = 50.0;

class SelectFormWidget extends HookWidget {
  final String? labelText;
  final TextStyle? style;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<dynamic> onChanged;
  const SelectFormWidget({
    Key? key,
    this.labelText,
    this.style,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    ValueNotifier<dynamic> selectedValue = useState(1);
    return TextFormWidget(
      controller: controller,
      labelText: labelText,
      style: style,
      readOnly: true,
      validator: validator,
      onTap: () => showCupertinoModalPopup<dynamic>(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () =>
                      Navigator.of(context).pop(selectedValue.value),
                ),
                SizedBox(
                  height: 220,
                  child: CupertinoPicker(
                    itemExtent: _kItemExtent,
                    onSelectedItemChanged: (newValue) =>
                        selectedValue.value = newValue,
                    children: List<Widget>.generate(
                      10,
                      (index) {
                        return Center(child: Text(index.toString()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).then((value) {
        if (value != null) {
          onChanged(value);
          log(value.toString());
          controller.text = value.toString();
        }
      }),
    );
  }
}
