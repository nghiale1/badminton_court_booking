import 'package:flutter/material.dart';
import 'package:badminton_court_booking/base/base.dart';
import 'package:badminton_court_booking/model/menu_item.dart';
import 'package:badminton_court_booking/ui/home/home_page.dart';
import 'package:badminton_court_booking/ui/menu/menu.dart';

import '../../../../base/base_home_page.dart';

class SupervisorHomePage extends BasePage {
  SupervisorHomePage({Key? key}) : super(key: key);

  @override
  _SupervisorHomePageState createState() => _SupervisorHomePageState();
}

class _SupervisorHomePageState extends BaseState<SupervisorHomePage>
    with BaseHomePage {
  @override
  int getDefaultIndex() => 0;

  @override
  List<MenuItem> getMenuItemList() => [
        MenuItem('home', const Icon(Icons.home), const Icon(Icons.home)),
        MenuItem('diary', const Icon(Icons.calendar_month),
            const Icon(Icons.calendar_month)),
        MenuItem('friend', const Icon(Icons.people), const Icon(Icons.people)),
        MenuItem('menu', const Icon(Icons.menu), const Icon(Icons.menu)),
        // MenuItem('contract', getMenuIcon('ic_contract.png'), getMenuIcon('ic_contract_tint.png')),
        // MenuItem('profile', getMenuIcon('ic_profile.png'), getMenuIcon('ic_profile_tint.png'))
      ];

  @override
  List<Widget> getContentPageList() =>
      [HomePage(), MenuPage()];

  @override
  Widget fab() => const SizedBox.shrink();
}
