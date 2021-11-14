import 'package:flutter/material.dart';

// NOTE we won't be using ThemeData here, as it seems to be tightly coupled with Material Design,
// something that we want to avoid as we have a custom UI that doesn't alienate iOS users.

// TODO how to more cleanly work with styles (and still not get forced to use material UI)

class Styles {
  static final Color primaryTextColor = hexToColor('000000');
  static final Color secondaryTextColor = hexToColor('666666'); // TODO confirm
  static final Color tertiaryTextColor = hexToColor('888888');
  static final Color dividerColor = hexToColor('CCCCCC');
  static final Color formBgColor = hexToColor('EEEEEE');

  static final Color primaryHighlightColor = hexToColor('49A9B3');

  static final String primaryFontRegular = 'Muli';

  // TODO find a heavier version of Quicksand instead of this 'Regular' version,
  // see https://www.steadycalendar.com screenshots for an example
  static final String secondaryFontRegular = 'Quicksand';

  static final FontWeight primaryFontWeightSemiBold = FontWeight.w700;
  static final FontWeight primaryFontWeightLight = FontWeight.w300;
  static final FontWeight primaryFontWeightExtraLight = FontWeight.w100;

  static final double primaryHeaderFontSize = 48.0;
  static final double secondaryHeaderFontSize = 22.0;
  static final double primaryButtonFontSize = 18.0;
  static final double primaryTextFormFieldFontSize = 20.0;
  static final double smallTextFontSize = 18.0;
  static final double miniTextFontSize = 14.0;

  static final TextStyle regularText = TextStyle(
      color: secondaryTextColor,
      fontFamily: primaryFontRegular,
      fontSize: primaryButtonFontSize);

  // TODO ability to pass in optional color override
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
        contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
        border: InputBorder.none,
        labelStyle: TextStyle(
          height: 0.0,
        ),
        helperStyle: TextStyle(
          height: 0.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Styles.tertiaryTextColor,
            fontWeight: Styles.primaryFontWeightLight,
            fontSize: Styles.primaryTextFormFieldFontSize));
  }

  // TODO separate out into our Styles class
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}

//  this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.fontStyle,
//     this.letterSpacing,
//     this.wordSpacing,
//     this.textBaseline,
//     this.height,
//     this.locale,
