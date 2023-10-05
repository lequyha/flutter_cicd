import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/autocomplete_form_widget.dart';

class DetailPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailPage());
  }

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xff209F84),
        title: const Text('Thông tin thuốc'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Tiếp tục',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoCompleteFormWidget(),
            // TextFormField(
            //   decoration: InputDecoration(
            //     fillColor: Colors.white,
            //     filled: true,
            //     isDense: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: const BorderSide(color: Colors.white),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: const BorderSide(color: Colors.white),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: const BorderSide(color: Color(0xff209F84)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
