import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/utils/formatDateFromTimestamp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'package:provider/provider.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({
    Key? key,
    required this.upcomingClasses,
    required this.upcomingProvider
  }) : super(key: key);

  final List<BookingInfo> upcomingClasses;
  final UpcomingProvider upcomingProvider;
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  Timer? timer;
  String durationText = "";
  late BookingInfo lastBooking;
  late var base64Decoded;
  late var urlObject;
  late var jsonRes;
  late var roomId;
  late var tokenMeeting;
  final String serverUrl = "https://meet.lettutor.com";
  late User userInfo;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    lastBooking = widget.upcomingClasses[0];
    base64Decoded = base64.decode(base64.normalize(lastBooking.studentMeetingLink.split("token=")[1].split(".")[1]));
    urlObject = utf8.decode(base64Decoded);
    jsonRes = json.decode(urlObject);
    roomId = jsonRes['room'];
    tokenMeeting = lastBooking.studentMeetingLink.split("token=")[1];
    userInfo = context.read<UserProvider>().userInfo!;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String formatTimeStart = formatDateFromTimestamp('E, dd, MMMM, yy HH:mm', lastBooking!.scheduleDetailInfo!.startPeriodTimestamp);
    timer ??= Timer.periodic(const Duration(seconds: 1), (timer) async {
      if(mounted){
        int now = DateTime.now().millisecondsSinceEpoch;
        int startTimestamp = lastBooking!.scheduleDetailInfo!.startPeriodTimestamp;
        int differenceTimestamp = (startTimestamp - now);
        if(differenceTimestamp > 0){
          final time = Duration(milliseconds: differenceTimestamp);
          final hours = time.inHours.remainder(60).toString().padLeft(2, '0');
          final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
          final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
          setState(() {
            durationText = '$hours:$minutes:$seconds ';
            isLoading = false;
          });
        }
        else{
          Navigator.pop(context);
          _joinMeeting();
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.navigate_before, color: Colors.black,size: 30,)
            ),
            Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text("Waiting room",style: TextStyle(color: Colors.black),)
            )
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: isLoading ? SpinKitRing(
          color: AppColors.primary,
          size: 50,
        ) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(durationText, style: const TextStyle(color: Colors.black, fontSize: 18)),
            Text('until lesson start ($formatTimeStart)', style: const TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
      ),
    );
  }
  _joinMeeting() async {

    final featureFlags = {
      /*FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.ANDROID_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.AUDIO_FOCUS_DISABLED: false,
      FeatureFlagEnum.AUDIO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.AUDIO_ONLY_BUTTON_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.CAR_MODE_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.CONFERENCE_TIMER_ENABLED: false,
      FeatureFlagEnum.CHAT_ENABLED: false,
      FeatureFlagEnum.FILMSTRIP_ENABLED: false,
      FeatureFlagEnum.FULLSCREEN_ENABLED: true,
      FeatureFlagEnum.HELP_BUTTON_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.IOS_RECORDING_ENABLED: false,
      FeatureFlagEnum.IOS_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.SPEAKERSTATS_ENABLED: false,
      FeatureFlagEnum.KICK_OUT_ENABLED: false,
      FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
      FeatureFlagEnum.LOBBY_MODE_ENABLED: false,
      FeatureFlagEnum.MEETING_NAME_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: false,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: false,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.REPLACE_PARTICIPANT: false,*/
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: true,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: true,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.REPLACE_PARTICIPANT: true,
      FeatureFlagEnum.RESOLUTION: FeatureFlagVideoResolution.MD_RESOLUTION,
      /*FeatureFlagEnum.SECURITY_OPTIONS_ENABLED: false,
      FeatureFlagEnum.SERVER_URL_CHANGE_ENABLED: false,
      FeatureFlagEnum.SETTINGS_ENABLED: false,
      FeatureFlagEnum.TILE_VIEW_ENABLED: true,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.TOOLBOX_ENABLED: true,
      FeatureFlagEnum.VIDEO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.VIDEO_SHARE_BUTTON_ENABLED: false,*/
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb && Platform.isAndroid) {
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    }
    // Define meetings options here
    final options = JitsiMeetingOptions(
        room: roomId,
        serverURL: serverUrl,
        subject: 'Learning',
        userDisplayName: userInfo.name,
        userEmail: userInfo.email,
        audioOnly: true,
        audioMuted: true,
        videoMuted: true,
        featureFlags: featureFlags,
        webOptions: {
          "roomName": roomId,
          "width": "100%",
          "height": "100%",
          "enableWelcomePage": false,
          "enableNoAudioDetection": true,
          "enableNoisyMicDetection": true,
          "enableClosePage": false,
          "prejoinPageEnabled": false,
          "hideConferenceTimer": true,
          "disableInviteFunctions": true,
          "chromeExtensionBanner": null,
          "configOverwrite": {
            "prejoinPageEnabled": false,
            "disableDeepLinking": true,
            "enableLobbyChat": false,
            "enableClosePage": false,
            "chromeExtensionBanner": null,
          },
          "userInfo": {"email": userInfo.email, "displayName": userInfo.name}
        });

    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onOpened: () {
            debugPrint("JitsiMeetingListener - onOpened");
          },
          onClosed: () {
            debugPrint("JitsiMeetingListener - onClosed");
          },
          onError: (error) {
            debugPrint("JitsiMeetingListener - onError: error: $error");
          },
          onConferenceWillJoin: (url) {
            debugPrint(
                "JitsiMeetingListener - onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("JitsiMeetingListener - onConferenceJoined: url:$url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint(
                "JitsiMeetingListener - onConferenceTerminated: url: $url, error: $error");
          },
          onParticipantLeft: (participantId) {
            debugPrint(
                "JitsiMeetingListener - onParticipantLeft: $participantId");
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint("JitsiMeetingListener - onParticipantJoined: "
                "email: $email, name: $name, role: $role, "
                "participantId: $participantId");
          },
          onAudioMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onAudioMutedChanged: muted: $muted");
          },
          onVideoMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onVideoMutedChanged: muted: $muted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint("JitsiMeetingListener - onScreenShareToggled: "
                "participantId: $participantId, isSharing: $isSharing");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("JitsiMeetingListener - readyToClose callback");
                }),
          ]
      ),
    );
  }
}
