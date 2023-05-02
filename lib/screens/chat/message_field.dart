import 'package:advanced_mobile/config/color.dart';
import 'package:flutter/material.dart';

class MessageField extends StatefulWidget {
  const MessageField({
    super.key,
    this.isMyMessage = true,
    this.message = '',
  });

  final bool isMyMessage;
  final String message;

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  var isPlaying  = false;
  @override
  Widget build(BuildContext context) {
    if(widget.isMyMessage == true){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                constraints: const BoxConstraints(maxWidth: 280),
                padding: const EdgeInsets.only(left: 15, top: 12, bottom: 12, right: 15),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(widget.message,style: const TextStyle(color: Colors.white),)
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Flexible(
          child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              constraints: const BoxConstraints(maxWidth: 280),
              padding: const EdgeInsets.only(left: 15, top: 12, bottom: 12, right: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Text(widget.message,style: const TextStyle(color: Colors.black),),
                ],
              )
          ),
        ),
      ],
    );
  }
}
