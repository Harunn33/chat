import 'package:chat/modules/chat/chat_page.dart';
import 'package:chat/modules/home/home.dart';
import 'package:chat/shared/constants/colors.dart';
import 'package:chat/shared/constants/strings.dart';
import 'package:chat/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.homeAppBarTitle,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    AppStrings.dialogTitle,
                  ),
                  content: Form(
                    key: controller.formKey,
                    child: TextFormField(
                      controller: controller.name,
                      validator: (value) {
                        if (value == null || value.length < 3) {
                          return AppStrings.validateText;
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    CustomTextButton(
                      text: AppStrings.cancel,
                      func: () {
                        controller.name.clear();
                        Get.back();
                      },
                    ),
                    CustomTextButton(
                      text: AppStrings.enter,
                      func: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.back();
                          Get.to(
                            ChatPage(
                              name: controller.name.text,
                            ),
                          );
                          controller.name.clear();
                        }
                      },
                      color: AppColors.ok,
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            AppStrings.homeBtnText,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
