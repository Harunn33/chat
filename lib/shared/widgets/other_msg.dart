import 'package:chat/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtherMsg extends StatelessWidget {
  String msg;
  String sender;
  OtherMsg({
    super.key,
    required this.msg,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 90.w,
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12.sp,
            ),
          ),
          margin: EdgeInsets.only(
            left: 2.w,
            bottom: 1.h,
            top: 1.h,
          ),
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.msgBoxNameColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: .6.h,
                ),
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.potBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
