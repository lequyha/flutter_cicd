import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/autocomplete_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/select_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/time_form_widget.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailPage());
  }

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final DateFormat timeFormat = DateFormat('HH:mm a');
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Thông tin thuốc'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                FlutterAlarmClock.createAlarm(
                  hour: 23,
                  minutes: 59,
                  title: 'Uống thuốc',
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text(
              'Tiếp tục',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoCompleteFormWidget(
                labelText: 'Tên thuốc',
                onChanged: (value) {
                  logger.i(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TimeFormWidget(
                      timeFormat: timeFormat,
                      onChanged: (dateTime) {
                        logger.i(dateTime);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: SelectFormWidget(
                      onChanged: (value) {
                        logger.i(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
