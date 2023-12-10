import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';

class ImageIfNull extends StatelessWidget {

  final String? url;

   const ImageIfNull({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return url != null ? Image.network(url!) : Image.asset(Constant.kAvatarDefault);
  }
}
