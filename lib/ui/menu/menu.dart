import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/router/route_constant.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.kPrimaryColor,

        elevation: 0.0, // Đặt elevation thành 0.0
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Avatar, Name, Phone
          Container(
            color: ColorPalette.kPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(Constant.kAvatarDefault),
                ),
                SizedBox(height: 8),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "123-456-7890",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ListTile(
                  leading: Icon(Icons.settings_system_daydream),
                  title: Text("Ước mơ"),
                  onTap: () {

                    Navigator.of(context).pushNamed(RouteList.dream);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text("Thống kê"),
                  onTap: () {
                    // Handle Home menu item click
                    print("Home menu item clicked");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_support),
                  title: Text("Hỗ trợ"),
                  onTap: () {
                    // Handle Diary menu item click
                    print("Diary menu item clicked");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Cài đặt"),
                  onTap: () {
                    // Handle Friend menu item click
                    print("Friend menu item clicked");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Góp ý"),
                  onTap: () {
                    // Handle Menu menu item click
                    print("Menu menu item clicked");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
