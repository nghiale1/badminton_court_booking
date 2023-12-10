import 'package:badminton_court_booking/common/common.dart';
import 'package:badminton_court_booking/ui/auth/component/title_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/style/dimen.dart';

import '../../router/route_constant.dart';
import '../../widget/button/positive_button_widget.dart';
import 'component/header_auth.dart';

class CompleteResetPasswordPage extends StatelessWidget {
  const CompleteResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/background.png'),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderAuth(),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: Dimen.horizontal),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleComponent(title: "complete_title_reset_password".translate(), content: "complete_content_reset_password".translate()),
                          const SizedBox(height: 22,),
                          Image.asset('assets/image/complete.png',
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.4),
                          const SizedBox(height: 40,),
                          PositiveButtonWidget(
                            text: "back_to_login".translate(),
                            isEnable: true,
                            onPressed: () async {
                              Navigator.of(context).pushNamedAndRemoveUntil(RouteList.login, (route) => false);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
