import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badminton_court_booking/common/common.dart';

import '../../cubit/loading/loading_cubit.dart';

class LoadingPage extends StatelessWidget {
  final Widget screen;

  LoadingPage({required this.screen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, shouldShow) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (shouldShow)
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2)),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(ColorPalette.kPrimaryColor),
                    strokeWidth: 4.0,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
