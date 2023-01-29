import 'package:chat/modules/chat/chat_controller.dart';
import 'package:chat/modules/home/home.dart';
import 'package:chat/shared/constants/constants.dart';
import 'package:chat/shared/widgets/other_msg.dart';
import 'package:chat/shared/widgets/own_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatPage extends GetView<ChatController> {
  final controller = Get.put(ChatController());
  String? name;
  ChatPage({
    this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.listMsg.length,
                itemBuilder: (context, index) {
                  if (controller.listMsg[index].type == "ownMsg") {
                    return OwnMsg(
                      msg: controller.listMsg[index].msg,
                      sender: controller.listMsg[index].sender,
                    );
                  } else {
                    return OtherMsg(
                      msg: controller.listMsg[index].msg,
                      sender: controller.listMsg[index].sender,
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 4.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.message,
                    maxLines: 3,
                    minLines: 1,
                    style: TextStyle(
                      color: AppColors.potBlack,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    controller.chatMessage.value = controller.message.text;
                    if (controller.chatMessage.value.isNotEmpty) {
                      controller.sendMessage(
                        controller.chatMessage.value,
                        name.toString(),
                      );
                      controller.message.clear();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 3.w,
                    ),
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.ok,
                      borderRadius: BorderRadius.circular(
                        6.h,
                      ),
                    ),
                    child: Icon(
                      Icons.send_outlined,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
