import 'dart:convert';
import 'dart:developer';

import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/models/chat/message_model.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatProvider extends ChangeNotifier{
  ChatProvider() {
    openAI = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50))
    );
    flutterTts = FlutterTts();
    flutterTts.setCompletionHandler(() {
      indexOfPlayingMessage = -1;
      notifyListeners();
    });
    final lang = pref.getString('language');
    if(lang=='english'){
      flutterTts.setLanguage('en-US');
    }
    else{
      flutterTts.setLanguage('vi-VN');
    }
    speechToText = SpeechToText();
  }
  late OpenAI openAI;
  late FlutterTts flutterTts;
  List<Message> messages = [];
  late SpeechToText speechToText;
  int indexOfPlayingMessage = -1;
  bool isResponse = false;
  final pref = Preference.getInstance();

  void setMessages(history){
    messages = history;
  }

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

  Future<void> playMessage(
      int indexOfMessage,
      String message) async{
    if(indexOfMessage == indexOfPlayingMessage){
      await flutterTts.stop();
      indexOfPlayingMessage = -1;
      notifyListeners();
    }
    else {
      indexOfPlayingMessage = indexOfMessage;
      notifyListeners();
      await flutterTts.stop();
      await flutterTts.setLanguage('en-US');
      await flutterTts.speak(message);
    }
  }
  void changeLanguage(String language){
    if(language =='english'){
      flutterTts.setLanguage('en-US');
    }
    else{
      flutterTts.setLanguage('vi-VN');
    }
    notifyListeners();
  }

  Future<LocaleName?> getLanguageStt(String lang) async{
    var locale;
    var locales = await speechToText.locales();
    for(int i =0;i<locales.length-1;i++){
    }
    if(lang =='English'){
      for(int i =0;i<locales.length-1;i++){
        if(locales[i].localeId =='en_US'){
          locale =  locales[i];
        }
      }
    }
    else{
      for(int i =0;i<locales.length-1;i++){
        if(locales[i].localeId =='vi_VN'){
          locale =  locales[i];
        }
      }
    }
    return locale;
  }
}