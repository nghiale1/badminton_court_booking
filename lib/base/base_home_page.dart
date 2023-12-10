import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badminton_court_booking/base/base.dart';
import 'package:badminton_court_booking/common/common.dart';

import '../model/menu_item.dart';

mixin BaseHomePage<Page extends BasePage> on BaseState<Page> {
  late PageController _pageController;

  late List<Widget> _contentPageList = getContentPageList();

  late final List<MenuItem> _menuItemList = getMenuItemList();
  late int _currentIndex = getDefaultIndex();

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController();
    _pageController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _contentPageList.map((Widget content) {
            return content;
          }).toList(),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  int getDefaultIndex();

  List<MenuItem> getMenuItemList();

  List<Widget> getContentPageList();

  Widget fab();

  @override
  String screenName() => "";

  @override
  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: Container(
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Text("123")
      ),
    );
  }

  @override
  Widget body() => SizedBox.shrink();
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          _pageController.jumpToPage(value);
          // this unfocus is to prevent show keyboard in the like page when focus on search text field
          FocusScope.of(context).unfocus();
        });
      },
      selectedFontSize: 12,
      selectedItemColor: ColorPalette.kPrimaryColor,
      unselectedItemColor: Colors.grey,
      iconSize: 24,
      items: _menuItemList.map((item) {
        return BottomNavigationBarItem(
          label: item.title,
          icon: Container(
            decoration: _currentIndex == _menuItemList.indexOf(item)
                ? BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ColorPalette.kPrimaryColor,
                  width: 2,
                ),
              ),
            )
                : null,
            child: _currentIndex == _menuItemList.indexOf(item)
                ? item.iconTint
                : item.icon,
          ),
        );
      }).toList(),
    );
  }


}
