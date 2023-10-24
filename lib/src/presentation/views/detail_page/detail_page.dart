import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/core/loading_manager.dart';
import 'package:flutter_application_test_public/src/locator.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/bloc/detail_bloc.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/detail_form.dart';
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
      create: (context) =>
          DetailBloc(getIt<LoadingManager>())..add(const Started()),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Thông tin thuốc'),
          centerTitle: true,
          actions: [
            BlocConsumer<DetailBloc, DetailState>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) {
                if (state is DetailStateSuccess) {
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<DetailBloc>().add(SavedPrescription());
                      // FlutterAlarmClock.createAlarm(
                      //   hour: 23,
                      //   minutes: 59,
                      //   title: 'Uống thuốc',
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                    }
                  },
                  child: const Text(
                    'Tiếp tục',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            return state.when(
              initial: () => Center(
                child: CircularProgressIndicator(),
              ),
              typing: (name, quantity, unit, frequency, dosage) {
                return DetailForm(formKey: formKey);
              },
              success: () => const Text('success'),
            );
          },
        ),
      ),
    );
  }
}
