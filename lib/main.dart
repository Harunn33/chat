import 'package:chat/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'Anonymous Chat',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.all(
                  12.sp,
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.btnColor,
              ),
            ),
          ),
          primarySwatch: Colors.green,
        ),
      );
    });
  }
}
