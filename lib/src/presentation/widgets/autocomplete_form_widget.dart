import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';

class AutoCompleteFormWidget extends StatelessWidget {
  const AutoCompleteFormWidget({Key? key}) : super(key: key);
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Tên thuốc ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Color(0xff209F84),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        LayoutBuilder(builder: (context, constraints) {
          return Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _kOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) =>
                    TextFormWidget(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (value) => onFieldSubmitted,
            ),
            optionsViewBuilder: (context, onSelected, options) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox(
                      height: 52.0 * options.length,
                      width: constraints.biggest.width, // <-- Right here !
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        shrinkWrap: false,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return InkWell(
                            onTap: () => onSelected(option),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(option),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onSelected: (String selection) {
              debugPrint('You just selected $selection');
            },
          );
        }),
      ],
    );
  }
}
