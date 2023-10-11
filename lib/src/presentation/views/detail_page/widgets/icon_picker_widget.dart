import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconPickerWidget extends HookWidget {
  const IconPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final ValueNotifier<int> currentIndex = useState(0);
    useEffect(() {
      void listener() {
        currentIndex.value = (scrollController.offset / 18).round();
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 18,
        controller: scrollController,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          color:
              currentIndex.value == index ? Colors.amber : Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/${index + 1}.svg'),
        ),
      ),
    );
  }
}
