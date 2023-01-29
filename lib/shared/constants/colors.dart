import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color cancel = const Color(0xFFEF5350);
  static Color ok = const Color(0xFF66BB6A);
  static Color btnColor = const Color(0xFF2E7D32);
  static Color white = const Color(0xFFFFFFFF);
  static Color potBlack = const Color(0xFF333333);
  static Color msgBoxColor = const Color(0xFFE8F5E9);
  static Color msgBoxNameColor = const Color(0xFF4568C0);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
