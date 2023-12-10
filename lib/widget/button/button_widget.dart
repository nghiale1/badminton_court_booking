import 'package:flutter/material.dart';

import '../../common/style/color_palette.dart';

class ButtonWidget {

  Widget createSquareIconButton({
    required String iconPath,
    required Function onTap
  }) {

    return GestureDetector(
      child: Image(
        image: AssetImage(iconPath),
        width: 40,
      ),
      onTap: onTap as void Function(),
    );
  }

  Widget createButton({required String labelText, required VoidCallback? onPressed}) {

    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {

              if (states.contains(MaterialState.disabled)) {
                return Colors.green.withOpacity(0.4);
              }

              if (states.contains(MaterialState.pressed))
                return Colors.green.withOpacity(0.7);

              return ColorPalette.kPrimaryColor; // Defer to the widget's default.
            },
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          )),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            labelText,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}