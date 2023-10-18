import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AutoCompleteFormWidget extends HookWidget {
  final String? labelText;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String> onChanged;
  final String? initialValue;

  const AutoCompleteFormWidget({
    Key? key,
    this.labelText,
    this.validator,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Autocomplete<String>(
          initialValue: controller.value,
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return _kOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder: (
            context,
            textEditingController,
            focusNode,
            onFieldSubmitted,
          ) =>
              TextFormWidget(
            onChanged: onChanged,
            labelText: labelText,
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (value) => onFieldSubmitted,
            validator: validator,
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
                    width: constraints.biggest.width,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: options.length,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
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
          onSelected: onChanged,
        );
      },
    );
  }
}
