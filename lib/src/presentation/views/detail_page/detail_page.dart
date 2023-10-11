import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/dosage_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/frequency_from_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/quantity_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/unit_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/autocomplete_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/number_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/time_form_widget.dart';

class DetailPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailPage());
  }

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                        flex: 2,
                        child: NumberFormWidget(
                          labelText: 'Tổng số lượng',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Expanded(
                        child: UnitFormWidget(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const FrequencyFormWidget(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35.0),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    const DosageFormWidget(),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TimeFormWidget(
                            onChanged: (dateTime) {
                              logger.i(dateTime);
                            },
                            textAlign: TextAlign.center,
                            fillColor: const Color(0xffF8F8F6),
                            prefixIcon: const Icon(Icons.schedule),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Expanded(
                          child: QuantityFormWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
