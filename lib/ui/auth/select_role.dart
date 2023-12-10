import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/router/route_constant.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(child: Image.asset('assets/image/logo.png')),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Center(
                child: const Text(
                  "Select your role to process",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              )),
          Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorPalette.kPrimaryColor,
                        onPrimary: Colors.white,
                        shadowColor: ColorPalette.kPrimaryColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteList.supervisorHome);},
                      child: Text('Muốn giúp đỡ'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorPalette.kPrimaryColor,
                        onPrimary: Colors.white,
                        shadowColor: ColorPalette.kPrimaryColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteList.supervisorHome);},
                      child: Text('Cần trợ giúp'),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
