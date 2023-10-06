import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TimeFormWidget extends HookWidget {
  final String? labelText;

  const TimeFormWidget({
    super.key,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    DateTime now = DateTime.now();
    DateTime? initialDateTime = DateTime(now.year, now.month, now.day, 0, 0);
    ValueNotifier<DateTime> selectedTime = useState(initialDateTime);
    useEffect(() {
      void listener() {
        if (controller.text.isEmpty) {
          selectedTime.value = initialDateTime;
        }
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);
    return TextFormWidget(
      controller: controller,
      labelText: labelText,
      readOnly: true,
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
                  onPressed: () =>
                      Navigator.of(context).pop(selectedTime.value),
                ),
                SizedBox(
                  height: 220,
                  child: CupertinoDatePicker(
                    initialDateTime: selectedTime.value,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    minuteInterval: 5,
                    onDateTimeChanged: (newTime) =>
                        selectedTime.value = newTime,
                  ),
                ),
              ],
            ),
          );
        },
      ).then((value) {
        if (value != null) {
          controller.text = value.toIso8601String();
        }
      }),
    );
  }
}
