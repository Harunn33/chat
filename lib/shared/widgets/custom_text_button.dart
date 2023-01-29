import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  Function func;
  String text;
  Color? color;
  CustomTextButton({
    super.key,
    required this.text,
    this.color,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        func();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: color ?? AppColors.cancel,
        ),
      ),
    );
  }
}
