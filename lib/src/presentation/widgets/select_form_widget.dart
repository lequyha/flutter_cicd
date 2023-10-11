import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/text_form_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const double _kItemExtent = 50.0;

class SelectFormWidget extends HookWidget {
  final String? labelText;
  final TextStyle? style;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<SelectItemModel?> onChanged;
  final List<SelectItemModel> items;
  final SelectItemModel? initialItem;
  final bool hideShowBtn;

  const SelectFormWidget({
    Key? key,
    this.labelText,
    this.style,
    this.validator,
    required this.onChanged,
    required this.items,
    this.initialItem,
    this.hideShowBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialItem?.label);
    final ValueNotifier<SelectItemModel?> selectedItem = useState(initialItem);
    final ValueNotifier<int> selectedIndex = useState(0);
    return TextFormWidget(
      controller: controller,
      labelText: labelText,
      style: style,
      readOnly: true,
      validator: validator,
      hideShowBtn: hideShowBtn,
      onTap: () => showCupertinoModalPopup<SelectItemModel?>(
        context: context,
        builder: (context) => Container(
          height: 220,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: AppBehavior(),
            child: CupertinoPicker.builder(
              itemExtent: _kItemExtent,
              childCount: items.length,
              scrollController:
                  FixedExtentScrollController(initialItem: selectedIndex.value),
              onSelectedItemChanged: (index) {
                final currentItem = items[index];
                controller.text = currentItem.label;
                selectedItem.value = currentItem;
                selectedIndex.value = items.indexOf(currentItem);
                onChanged(currentItem);
              },
              itemBuilder: (context, index) => Center(
                child: Text(items[index].label.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
