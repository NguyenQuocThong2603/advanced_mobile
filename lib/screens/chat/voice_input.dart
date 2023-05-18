import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/setting_provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:advanced_mobile/providers/chat_provider.dart';


class VoiceInput extends StatefulWidget {
  const VoiceInput({
    Key? key,
    required this.inputController,
    required this.chatProvider
  }) : super(key: key);

  final TextEditingController inputController;
  final ChatProvider chatProvider;
  @override
  State<VoiceInput> createState() => _VoiceInputState();
}

class _VoiceInputState extends State<VoiceInput> {
  bool isTalking = false;
  bool isAvailable = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarGlow(
            endRadius: 50,
            duration: const Duration(milliseconds: 1000),
            glowColor: AppColors.primary,
            animate: isTalking,
            repeat: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
            showTwoGlows: true,
            child: GestureDetector(
              onTapDown: (details) async{
                if(!isTalking){
                  LocaleName? language;
                  if(!isAvailable){
                    await widget.chatProvider.speechToText.initialize();
                    language = await widget.chatProvider.getLanguageStt(context.read<SettingProvider>().language);
                  }
                  setState(() {
                    isTalking = true;
                    widget.chatProvider.speechToText.listen(
                        pauseFor: const Duration(days: 1),
                        localeId: language?.localeId,
                        onResult: (result) {
                          setState(() {
                            widget.inputController.text = result.recognizedWords;
                          });
                        }
                    );
                  });
                }
              },
              onTapUp: (details) {
                setState(() {
                  isTalking = false;
                });
                widget.chatProvider.speechToText.stop();
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 35,
                child: Icon(isTalking ? Icons.mic : Icons.mic_none,color: Colors.white),
              ),
            )
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              isTalking ? S.of(context)!.stopVoice : S.of(context)!.inputVoice,
              style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w500),)
        )
      ],
    );
  }
}
