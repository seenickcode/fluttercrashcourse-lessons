import 'package:flutter/material.dart';

// NOTE we won't be using ThemeData here, as it is tightly coupled with Material Design,
// something that we want to avoid as we have a custom UI that doesn't alienate iOS users.

class Styles {
  static final Color primaryTextColor = hexToColor('000000');
  static final Color secondaryTextColor = hexToColor('666666');
  static final Color tertiaryTextColor = hexToColor('888888');
  static final Color dividerColor = hexToColor('CCCCCC');
  static final Color formBgColor = hexToColor('EEEEEE');

  static final Color primaryHighlightColor = hexToColor('49A9B3');

  static const String primaryFontRegular = 'Muli';

  static const String secondaryFontRegular = 'Quicksand';

  static final FontWeight primaryFontWeightSemiBold = FontWeight.w700;
  static final FontWeight primaryFontWeightLight = FontWeight.w300;
  static final FontWeight primaryFontWeightExtraLight = FontWeight.w100;

  static const double primaryHeaderFontSize = 32.0;
  static const double secondaryHeaderFontSize = 22.0;
  static const double primaryButtonFontSize = 18.0;
  static const double primaryTextFormFieldFontSize = 20.0;
  static const double smallTextFontSize = 18.0;
  static const double miniTextFontSize = 14.0;

  static final TextStyle regularText = TextStyle(
      color: secondaryTextColor,
      fontFamily: primaryFontRegular,
      fontSize: Styles.primaryButtonFontSize);

  static final TextStyle tooltipText = TextStyle(
      color: Styles.secondaryTextColor,
      fontSize: Styles.miniTextFontSize,
      fontFamily: Styles.primaryFontRegular);

  static final TextStyle navBarTextStyle = TextStyle(
      color: primaryTextColor,
      fontFamily: primaryFontRegular,
      fontSize: secondaryHeaderFontSize,
      fontWeight: primaryFontWeightSemiBold);

  static final TextStyle textFormFieldStyle = TextStyle(
      color: Styles.primaryTextColor,
      fontWeight: Styles.primaryFontWeightLight,
      fontSize: Styles.secondaryHeaderFontSize);

  static InputDecoration textFormFieldDecoration(String hintText) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
        border: InputBorder.none,
        labelStyle: const TextStyle(
          height: 0.0,
        ),
        helperStyle: const TextStyle(
          height: 0.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Styles.tertiaryTextColor,
            fontWeight: Styles.primaryFontWeightLight,
            fontSize: Styles.primaryTextFormFieldFontSize));
  }

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
