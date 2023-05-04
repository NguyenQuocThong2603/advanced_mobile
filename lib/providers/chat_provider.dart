import 'dart:convert';
import 'dart:developer';

import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/models/chat/message_model.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{
  ChatProvider() {
    openAI = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50))
    );
  }
  late OpenAI openAI;
  List<Message> messages = [];
  bool isResponse = false;
  final pref = Preference.getInstance();

  Future<void> sendRequest(
      String newMessage,
      ScrollController scrollController,
      TextEditingController inputController) async{
    try{
      inputController.text = "";
      messages.add(Message(role: 'user', message: newMessage));
      isResponse = true;
      notifyListeners();
      if (scrollController.hasClients) {
        Future.delayed(
            const Duration(milliseconds: 200),
                () async {
              scrollController.jumpTo(0);
            }
        );
      }
      final request = ChatCompleteText(
          model: ChatModel.gptTurbo,
          maxToken: 3500 ,
          messages: [
            Map.of({
              'role': 'user',
              'content': newMessage,
            })
          ]);
      final response = await openAI.onChatCompletion(request: request);
      if(response!=null){
        messages.add(Message(
          role: response.choices[0].message!.role,
          message: response.choices[0].message!.content,
        ));
        isResponse = false;
        notifyListeners();
        if (scrollController.hasClients) {
          scrollController.jumpTo(0);
        }
      }
      await pref.setString("history", jsonEncode(messages.map((e) => e.toJson()).toList()),);
    }catch(err){
      log(err.toString());
      throw Exception();
    }
  }
}