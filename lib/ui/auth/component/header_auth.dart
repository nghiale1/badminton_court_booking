import 'package:flutter/cupertino.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.horizontalImage, vertical: Dimen.verticalImage),
      child: Row(
        children: [
          Image.asset('assets/icon/logo.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4),
        ],
      ),
    );
  }
}