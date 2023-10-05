import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/presentation/views/home_page/home_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarWidget extends HookWidget {
  const NavbarWidget({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const HomePage(
        title: 'Màn hình 1',
      ),
      const HomePage(
        title: 'Màn hình 2',
      ),
      const SizedBox.shrink(),
      const HomePage(
        title: 'Màn hình 4',
      ),
      const HomePage(
        title: 'Màn hình 5',
      ),
    ];
  }

  PersistentBottomNavBarItem _customPersistentBottomNavBarItem({
    required int selectedIndex,
    required int index,
    required String assetName,
    required String semanticsLabel,
    final Function(BuildContext?)? onPressed,
  }) =>
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          assetName,
          semanticsLabel: semanticsLabel,
          color: index == 2
              ? null
              : selectedIndex == index
                  ? const Color(0xff209F84)
                  : const Color(0xffAEAEAE),
        ),
        onPressed: onPressed,
      );

  List<PersistentBottomNavBarItem> _navBarsItems({
    required BuildContext context,
    required int selectedIndex,
  }) {
    return [
      _customPersistentBottomNavBarItem(
        assetName: 'assets/calendar.svg',
        semanticsLabel: 'Calendar icon',
        index: 0,
        selectedIndex: selectedIndex,
      ),
      _customPersistentBottomNavBarItem(
        assetName: 'assets/paper.svg',
        semanticsLabel: 'Paper icon',
        index: 1,
        selectedIndex: selectedIndex,
      ),
      _customPersistentBottomNavBarItem(
        assetName: 'assets/add.svg',
        semanticsLabel: 'Add icon',
        index: 2,
        selectedIndex: selectedIndex,
        onPressed: (_) => showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MenuItemWidget(
                assetName: 'assets/scan.svg',
                semanticsLabel: 'Scan icon',
                title: 'Scan toa thuốc',
              ),
              SizedBox(height: 16),
              MenuItemWidget(
                assetName: 'assets/constact.svg',
                semanticsLabel: 'Constact icon',
                title: 'Nhập toa thuốc',
              ),
              SizedBox(height: kBottomNavigationBarHeight + 16),
            ],
          ),
        ),
      ),
      _customPersistentBottomNavBarItem(
        assetName: 'assets/search.svg',
        semanticsLabel: 'Search icon',
        index: 3,
        selectedIndex: selectedIndex,
      ),
      _customPersistentBottomNavBarItem(
        assetName: 'assets/setting.svg',
        semanticsLabel: 'Setting icon',
        index: 4,
        selectedIndex: selectedIndex,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(
        context: context,
        selectedIndex: selectedIndex.value,
      ),
      onItemSelected: (value) => selectedIndex.value = value,
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String assetName;
  final String semanticsLabel;
  final String title;

  const MenuItemWidget({
    super.key,
    required this.assetName,
    required this.semanticsLabel,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: ListTile(
        leading: SvgPicture.asset(
          assetName,
          semanticsLabel: semanticsLabel,
        ),
        contentPadding: const EdgeInsets.all(8),
        title: Text(title),
      ),
    );
  }
}
