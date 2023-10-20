import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/dosage_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/frequency_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/name_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/quantity_and_unit_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/time_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/total_quantity_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/unit_of_prescription_form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailPage());
  }

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => DetailBloc()..add(const DetailEvent.started()),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Thông tin thuốc'),
          centerTitle: true,
          actions: [
            BlocBuilder<DetailBloc, DetailState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  typing: (name, quantity, unit, frequency, dosage) =>
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
                  success: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return state.when(
              initial: () => const Text('initial'),
              typing: (name, quantity, unit, frequency, dosage) {
                return Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrescriptionNameFormWidget(
                            initialValue: name,
                            onChanged: (value) => context
                                .read<DetailBloc>()
                                .add(DetailEvent.onChangedName(name: value)),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: PrescriptionTotalQuantityFormWidget(
                                  initialValue: quantity?.toString() ?? '',
                                  onChanged: (value) =>
                                      context.read<DetailBloc>().add(
                                            DetailEvent.onChangedQuantity(
                                              quantity: int.tryParse(value),
                                            ),
                                          ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: PrescriptionUnitFormWidget(
                                  initialValue: unit,
                                  onChanged: (value) =>
                                      context.read<DetailBloc>().add(
                                            DetailEvent.onChangedUnit(
                                              unit: value,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          PrescriptionFrequencyFormWidget(
                            initialValue: frequency,
                            onChanged: (value) =>
                                context.read<DetailBloc>().add(
                                      DetailEvent.onChangedFrequency(
                                        frequency: value,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 16.0),
                          PrescriptionDosageFormWidget(
                            initialValue: dosage,
                            onChanged: (value) =>
                                context.read<DetailBloc>().add(
                                      DetailEvent.onChangedDosage(
                                        dosage: value,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 16.0),
                          ...List<Widget>.generate(
                            dosage?.value ?? 0,
                            (index) => Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: PresctiptionTimeFormWidget(),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child:
                                          QuantityAndUnitPrescriptionFormWidget(
                                        unitLable: unit?.label,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                              ],
                            ),
                          ).toList(),
                          // const IconPickerWidget(
                          //   labelText: 'Ảnh hiển thị',
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              success: () => const Text('success'),
            );
          },
        ),
      ),
    );
  }
}
