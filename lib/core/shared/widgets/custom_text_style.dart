import 'package:flutter/material.dart';

TextStyle customTextStyle({
  Color? color,
  double? size,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}
