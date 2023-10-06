import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFormWidget extends HookWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final String? labelText;
  final bool readOnly;

  const TextFormWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTap,
    this.labelText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> showClearBtn = useState(false);
    useEffect(() {
      void listener() =>
          showClearBtn.value = controller?.text.isNotEmpty ?? false;
      controller?.addListener(listener);
      return () => controller?.removeListener(listener);
    }, [controller]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              const TextSpan(
                text: ' *',
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
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xff209F84)),
            ),
            suffixIcon: Visibility(
              visible: showClearBtn.value,
              child: IconButton(
                onPressed: controller?.clear,
                icon: const Icon(
                  Icons.cancel,
                  color: Color(0xff209F84),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
