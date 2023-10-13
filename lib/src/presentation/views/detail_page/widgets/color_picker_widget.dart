import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/const/color.dart';

class ColorPickerWidget extends StatelessWidget {
  final int iconIndex;
  final ValueChanged<int> onChanged;
  const ColorPickerWidget(
      {super.key, required this.iconIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, Color>> colorStringToColorInIconPickerList =
        colorStringToColorInIconPicker.entries.toList();
    return AspectRatio(
      aspectRatio: 8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorStringToColorInIconPickerList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onChanged(index),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: iconIndex == index ? const Color(0xffE7E7E7) : null,
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorStringToColorInIconPickerList[index].value,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
