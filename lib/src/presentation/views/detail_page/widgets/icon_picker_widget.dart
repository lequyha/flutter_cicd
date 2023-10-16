import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_application_test_public/src/const/color.dart';
import 'package:flutter_application_test_public/src/image_picker_manager.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/color_picker_widget.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/preview_image_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class IconPickerWidget extends HookWidget {
  final String? labelText;

  const IconPickerWidget({
    super.key,
    this.labelText,
  });

  int getItemIndex(double offset, double itemHeight) {
    return (offset / itemHeight).floor();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState(0);
    final ValueNotifier<int> selectedIconIndex = useState(0);
    final ValueNotifier<int> selectedIconIndex2 = useState(0);
    final ValueNotifier<XFile?> selectedImage = useState(null);
    final List<MapEntry<String, Color>> colorStringToColorInIconPickerList =
        colorStringToColorInIconPicker.entries.toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelText != null)
          Column(
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
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffAAAAAA).withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 8,
                  child: CarouselSlider.builder(
                    itemCount: 19,
                    itemBuilder: (context, index, realIndex) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: currentIndex.value == index
                              ? const Color(0xffE7E7E7)
                              : null,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Center(
                          child: index != 2
                              ? SvgPicture.asset(
                                  'assets/${index + 1}.svg',
                                  colorFilter: ColorFilter.mode(
                                    currentIndex.value == index &&
                                            currentIndex.value != 0 &&
                                            currentIndex.value != 1 &&
                                            currentIndex.value != 2
                                        ? colorStringToColorInIconPickerList[
                                                selectedIconIndex.value]
                                            .value
                                        : Colors.white,
                                    BlendMode.modulate,
                                  ),
                                )
                              : SvgPicture.string(
                                  '''
                                    <svg width="73" height="73" viewBox="0 0 73 73" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M51.5501 52.4838C50.7187 53.316 49.7314 53.9761 48.6448 54.4265C47.5581 54.8769 46.3933 55.1087 45.217 55.1087C44.0407 55.1087 42.8759 54.8769 41.7893 54.4265C40.7026 53.9761 39.7154 53.316 38.884 52.4838L28.7856 42.3378L41.3802 29.6045L51.5501 39.8207C52.3818 40.652 53.0415 41.6391 53.4917 42.7255C53.9418 43.8119 54.1735 44.9763 54.1735 46.1523C54.1735 47.3282 53.9418 48.4926 53.4917 49.579C53.0415 50.6654 52.3818 51.6525 51.5501 52.4838Z" fill="${currentIndex.value == index ? colorStringToColorInIconPickerList[selectedIconIndex2.value].key : Colors.white}"/>
                                    <path d="M41.4474 29.6654L28.7798 42.3331L17.9787 31.532C14.4813 28.0346 15.381 23.2705 18.8739 19.7716C18.9814 19.6641 19.0948 19.5597 19.2082 19.4567L19.4305 19.2628C21.145 17.8116 23.3424 17.0579 25.5867 17.1513C27.831 17.2447 29.9581 18.1784 31.5461 19.7671L41.4474 29.6654Z" fill="${currentIndex.value == index ? colorStringToColorInIconPickerList[selectedIconIndex.value].key : Colors.white}"/>
                                    <path d="M45.2195 56.0147C43.9241 56.0183 42.6409 55.765 41.4441 55.2694C40.2473 54.7738 39.1607 54.0458 38.2471 53.1275L20.4482 35.275L18.2429 33.0697C16.9943 31.8203 16.1041 30.2585 15.6652 28.5475C15.2264 26.8365 15.255 25.0391 15.7482 23.3429C15.8022 23.1554 15.9159 22.9907 16.0722 22.8738C16.2284 22.7569 16.4185 22.6942 16.6136 22.6954C16.7195 22.695 16.8246 22.7137 16.924 22.7506C17.1388 22.8301 17.3156 22.988 17.4189 23.1925C17.5221 23.3971 17.5441 23.6331 17.4805 23.8532C17.079 25.238 17.0565 26.7051 17.4152 28.1016C17.774 29.4981 18.5009 30.7727 19.5202 31.7925L28.771 41.0433L40.1599 29.6544L30.9091 20.4035C29.3983 18.8942 27.3501 18.0465 25.2146 18.0465C23.0791 18.0465 21.0309 18.8942 19.5202 20.4035C19.1646 20.7588 18.8429 21.1464 18.5593 21.5614C18.4315 21.7491 18.2378 21.8818 18.0166 21.9332C17.7955 21.9846 17.5631 21.951 17.3656 21.8389H17.3552C17.2481 21.776 17.1552 21.6917 17.0822 21.5912C17.0091 21.4908 16.9576 21.3764 16.9307 21.2552C16.9038 21.134 16.9022 21.0085 16.926 20.8866C16.9497 20.7647 16.9983 20.6491 17.0687 20.5468C17.4155 20.04 17.8086 19.5665 18.2429 19.1323C19.1562 18.214 20.2426 17.486 21.4392 16.9904C22.6357 16.4948 23.9187 16.2415 25.2139 16.2452H25.3109C27.9266 16.2776 30.4239 17.3415 32.2594 19.2054L47.8261 34.8154C47.9952 34.9849 48.0902 35.2146 48.0902 35.454C48.0902 35.6934 47.9952 35.9231 47.8261 36.0926C47.7428 36.1774 47.6434 36.2448 47.5338 36.2908C47.4241 36.3368 47.3064 36.3605 47.1875 36.3605C47.0686 36.3605 46.9509 36.3368 46.8413 36.2908C46.7316 36.2448 46.6323 36.1774 46.5489 36.0926L41.4446 30.948L30.0541 42.3324L39.5228 51.8473C40.2691 52.5974 41.1567 53.192 42.1343 53.5969C43.1118 54.0018 44.1599 54.2089 45.218 54.2063H45.4493C47.0209 54.1593 48.5445 53.6535 49.8322 52.7512C51.1198 51.8489 52.1154 50.5896 52.6961 49.1284C53.2768 47.6672 53.4173 46.0681 53.1002 44.528C52.7831 42.988 52.0224 41.5744 50.9117 40.4614L48.5408 38.089C48.3715 37.9196 48.2763 37.6899 48.2763 37.4504C48.2763 37.2109 48.3715 36.9812 48.5408 36.8118C48.7102 36.6424 48.9399 36.5473 49.1794 36.5473C49.419 36.5473 49.6487 36.6424 49.818 36.8118L52.1889 39.1827C53.5679 40.5614 54.5071 42.318 54.8877 44.2305C55.2684 46.143 55.0734 48.1254 54.3274 49.927C53.5814 51.7286 52.3179 53.2686 50.6967 54.3522C49.0756 55.4358 47.1695 56.0143 45.2195 56.0147Z" fill="black"/>
                                    </svg>
                                  ''',
                                ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 0.2,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          currentIndex.value = index,
                    ),
                  ),
                ),
              ),
              ScrollConfiguration(
                behavior: AppBehavior(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Visibility(
                        visible: currentIndex.value == 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: selectedImage.value != null
                                ? PreviewImageWidget(
                                    width: 150.0,
                                    height: 150.0,
                                    pickedImage: selectedImage.value!,
                                    onCanceled: () =>
                                        selectedImage.value = null,
                                  )
                                : ElevatedButton(
                                    onPressed: () => ImagePickerManager()
                                        .pickImage(
                                      ImageSource.gallery,
                                      context: context,
                                    )
                                        .then(
                                      (pickedImage) {
                                        if (pickedImage != null) {
                                          selectedImage.value = pickedImage;
                                        }
                                      },
                                    ),
                                    child: const Text('Chọn ảnh'),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Visibility(
                        visible:
                            currentIndex.value != 1 && currentIndex.value != 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColorPickerWidget(
                            iconIndex: selectedIconIndex.value,
                            onChanged: (value) =>
                                selectedIconIndex.value = value,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Visibility(
                        visible: currentIndex.value == 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColorPickerWidget(
                            iconIndex: selectedIconIndex2.value,
                            onChanged: (value) =>
                                selectedIconIndex2.value = value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
