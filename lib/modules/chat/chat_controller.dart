import 'package:chat/models/msg_models.dart';
import 'package:chat/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  IO.Socket? socket;
  dynamic userId;
  final listMsg = RxList<MsgModel>();

  RxString chatMessage = "".obs;
  final TextEditingController message = TextEditingController();
  final HomeController homeController = HomeController();
  final Uuid uuid = Uuid();

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  void connect() {
    userId = uuid.v1();

    socket = IO.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print("frontend bağlandı");
      socket!.on("sendMsgServer", (msg) {
        print(msg);
        if (msg["userID"] != userId) {
          listMsg.add(
            MsgModel(
              msg: msg["msg"],
              type: msg["type"],
              sender: msg["sender"],
            ),
          );
        }

        print(listMsg);
      });
    });
  }

  void sendMessage(String msg, String sender) {
    MsgModel ownMsg = MsgModel(msg: msg, type: "ownMsg", sender: sender);
    listMsg.add(ownMsg);

    socket!.emit("sendMsg", {
      "type": "ownMsg",
      "msg": msg,
      "sender": sender,
      "userID": userId,
    });
  }
}
