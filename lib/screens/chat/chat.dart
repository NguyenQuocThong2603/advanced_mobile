import 'dart:convert';

import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/models/chat/message_model.dart';
import 'package:advanced_mobile/providers/chat_provider.dart';
import 'package:advanced_mobile/screens/chat/loading.dart';
import 'package:advanced_mobile/screens/chat/message_field.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController inputController;
  late ScrollController scrollController;
  final pref = Preference.getInstance();
  late List<Message> history;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    scrollController = ScrollController();
    var data = pref.getString('history');
    if(data !=null) {
      history = List<Message>.from(jsonDecode(data).map((message) => Message.fromJson(message)));
    }else{
      history = [];
    }
    setState(() {
      isLoading = false;
    });
    context.read<ChatProvider>().messages;
  }

  @override
  void dispose() {
    inputController.dispose();
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider,_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'ChatGPT',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: !isLoading ? ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: chatProvider.messages.length,
                        itemBuilder: (context, index) {
                          return MessageField(
                            isMyMessage: chatProvider.messages[chatProvider.messages.length - index - 1]
                                .role == 'user',
                            message: chatProvider.messages[chatProvider.messages.length - index - 1]
                                .message,
                          );
                        },
                      ) : SpinKitFadingCircle(
                        size: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                            ),
                          );
                        },
                      ),
                  )
              ),
              Loading(isResponse: chatProvider.isResponse,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: inputController,
                        style: TextStyle(fontSize: 16, color: Colors.grey
                            .shade900),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                            hintText: 'Type a question'
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      try{
                        if(inputController.text !=""){
                          await chatProvider.sendRequest(
                              inputController.text,
                              scrollController,
                              inputController
                          );
                        }
                      } catch(error){
                        inputController.text = "";
                        showErrorToast('Error: Something went wrong, please try later!');
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.primary,
                      size: 32,),
                  )
                ],
              ),
              const SizedBox(height: 16,)
            ],
          ),
        );
      }
    );
  }
}
