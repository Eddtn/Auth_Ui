// ignore_for_file: sized_box_for_whitespace

import 'package:auth_ui/utilis/colors.dart';
import 'package:auth_ui/utilis/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  static const Color _kPrimary = Color(0xff4BAD60);
  final String title;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;

  const AppButton(
      {Key? key,
      required this.title,
      this.backgroundColor = _kPrimary,
      this.textColor = Colors.white,
      this.onTap,
      this.height,
      this.width})
      : super(key: key);

  const AppButton.white({
    Key? key,
    required this.title,
    this.onTap,
    this.height,
    this.width,
  })  : backgroundColor = Colors.white,
        textColor = _kPrimary,
        super(key: key);

  const AppButton.green({
    Key? key,
    required this.title,
    this.onTap,
    this.height,
    this.width,
  })  : backgroundColor = _kPrimary,
        textColor = Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
                color: kPrimaryColor, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: AppText.button(
            title,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
