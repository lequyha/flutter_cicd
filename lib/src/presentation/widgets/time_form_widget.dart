import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class TimeFormWidget extends HookWidget {
  final String? labelText;
  final DateFormat? timeFormat;
  final TextStyle? style;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<DateTime?> onChanged;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;

  const TimeFormWidget({
    super.key,
    this.labelText,
    this.timeFormat,
    this.style,
    this.validator,
    required this.onChanged,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime? initialDateTime = DateTime(now.year, now.month, now.day, 8, 0);
    final controller = useTextEditingController(
        text: (timeFormat ?? DateFormat('HH:mm a')).format(initialDateTime));
    final ValueNotifier<DateTime> selectedTime = useState(initialDateTime);
    final ValueNotifier<DateTime> currentTime = useState(initialDateTime);
    return TextFormWidget(
      controller: controller,
      labelText: labelText,
      style: style,
      readOnly: true,
      validator: validator,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      textAlign: textAlign,
      hideShowBtn: true,
      onTap: () => showCupertinoModalPopup<DateTime>(
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
                  onPressed: () => Navigator.of(context).pop(currentTime.value),
                ),
                SizedBox(
                  height: 220,
                  child: CupertinoDatePicker(
                    initialDateTime: selectedTime.value,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    minuteInterval: 5,
                    onDateTimeChanged: (newTime) => currentTime.value = newTime,
                  ),
                ),
              ],
            ),
          );
        },
      ).then((value) {
        if (value != null) {
          onChanged(value);
          selectedTime.value = currentTime.value;
          controller.text = (timeFormat ?? DateFormat('HH:mm a')).format(value);
        }
      }),
    );
  }
}
