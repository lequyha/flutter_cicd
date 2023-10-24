import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/detail_page_widgets.dart';

class DetailForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const DetailForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
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
              NameInput(),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TotalQuantityInput(),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: UnitDropDown(),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              FrequencyDropDown(),
              const SizedBox(height: 16.0),
              DosageDropDown(),
              const SizedBox(height: 16.0),
              // ...List<Widget>.generate(
              //   dosage?.value ?? 0,
              //   (index) => Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           const Expanded(
              //             flex: 2,
              //             child: PresctiptionTimeFormWidget(),
              //           ),
              //           const SizedBox(width: 16.0),
              //           Expanded(
              //             child: QuantityAndUnitPrescriptionFormWidget(
              //               unitLable: unit?.label,
              //               onChanged: (value) {},
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 16.0),
              //     ],
              //   ),
              // ).toList(),
              // const IconPickerWidget(
              //   labelText: 'Ảnh hiển thị',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
