// ignore_for_file: prefer_equal_for_default_values, use_key_in_widget_constructors

import 'package:auth_ui/constants/textStyle.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;

  /// biggest text
  AppText.heading1(this.text,
      {this.multiText = false,
      this.overflow = TextOverflow.ellipsis,
      this.centered = false,
      this.color,
      this.maxLines})
      : style = headingStyle1.copyWith(color: color);

  /// h2 text
  AppText.heading2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = headingStyle2.copyWith(color: color);

  /// h3 text
  AppText.heading3(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = headingStyle3.copyWith(color: color);

  /// h4text
  AppText.heading4(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = headingStyle4.copyWith(color: color);

  /// h5 text
  AppText.heading5(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = headingStyle5.copyWith(color: color);

  /// h6 text
  AppText.heading6(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = headingStyle6.copyWith(color: color);

  /// normal body text
  AppText.body1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = bodyStyle1.copyWith(color: color);

  /// small body text
  AppText.body2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = bodyStyle1.copyWith(color: color);

  /// caption text
  AppText.caption(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = captionStyle.copyWith(color: color);

  /// button text
  AppText.button(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = buttonStyle.copyWith(color: color);

  /// smallest text
  AppText.small(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
  }) : style = small.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : TextAlign.left,
      style: style,
    );
  }
}
