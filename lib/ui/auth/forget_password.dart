import 'package:flutter/material.dart';

import 'component/forget_password_component.dart';
import 'component/header_auth.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ForgetPasswordBody(),
    );
  }
}

class _ForgetPasswordBody extends StatelessWidget {
  const _ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/image/background.png'),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HeaderAuth(),
                ForgetPasswordComponent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}