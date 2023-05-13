import 'dart:async';

import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/screens/video_call/video_call.dart';
import 'package:advanced_mobile/utils/formatDateFromTimestamp.dart';
import 'package:flutter/material.dart';

class UpcomingBanner extends StatefulWidget {
  const UpcomingBanner({
    Key? key,
    required this.upcomingClasses,
    required this.upcomingProvider
  }) : super(key: key);

  final List<BookingInfo> upcomingClasses;
  final UpcomingProvider upcomingProvider;
  @override
  State<UpcomingBanner> createState() => _UpcomingBannerState();
}

class _UpcomingBannerState extends State<UpcomingBanner> {
  String durationText = "";
  bool isCountdown = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.upcomingClasses.isEmpty){
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        height: 140,
        color: const Color.fromRGBO(12, 61,223, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have no upcoming lesson.',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 8,),
            Text(
              'Total lesson time is ${widget.upcomingProvider.totalHour} hours '
                  '${widget.upcomingProvider.totalMinute} minutes',
              style: const TextStyle(color:Colors.white,fontSize: 16),
            )
          ],
        ),
      );
    }
    final lastBooking = widget.upcomingClasses[0];
    String formatTimeStart = formatDateFromTimestamp('E, dd, MMMM, yy HH:mm', lastBooking!.scheduleDetailInfo!.startPeriodTimestamp);
    String formatTimeEnd = formatDateFromTimestamp('HH:mm', lastBooking!.scheduleDetailInfo!.endPeriodTimestamp);
    timer ??= Timer.periodic(const Duration(seconds: 1), (timer) async {
      if(mounted){
        int now = DateTime.now().millisecondsSinceEpoch;
        int startTimestamp = lastBooking!.scheduleDetailInfo!.startPeriodTimestamp;
        int endTimestamp = lastBooking!.scheduleDetailInfo!.endPeriodTimestamp;
        if(now > endTimestamp){
          await widget.upcomingProvider.getUpcomingClasses(context);
        }
        isCountdown = now < startTimestamp;
        int differenceTimestamp = isCountdown ? (startTimestamp - now) : (now-startTimestamp);
        final time = Duration(milliseconds: differenceTimestamp);
        final hours = time.inHours.remainder(60).toString().padLeft(2, '0');
        final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
        setState(() {
          durationText = isCountdown ? ' (starts in $hours:$minutes:$seconds)'
              : ' (classes in $hours:$minutes:$seconds)';
          isCountdown;
        });
      }
    });
    return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            height: 140,
            color: const Color.fromRGBO(12, 61,223, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upcoming lesson',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$formatTimeStart - $formatTimeEnd',
                        style: const TextStyle(color:Colors.white,fontSize: 16)
                      ),
                      isCountdown == false ? Text(durationText,style: const TextStyle(color: Colors.greenAccent),)
                          : Text(durationText,style: const TextStyle(color: Colors.yellow),)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                            VideoCallScreen(upcomingProvider:widget.upcomingProvider,upcomingClasses: widget.upcomingClasses,)));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      child: const Text('Enter lesson room', style: TextStyle(color: Color.fromRGBO(12, 61,223, 1)),)
                  ),
                ),
                Text(
                  'Total lesson time is ${widget.upcomingProvider.totalHour} hours '
                      '${widget.upcomingProvider.totalMinute} minutes',
                  style: const TextStyle(color:Colors.white,fontSize: 14),
                )
              ],
            ),
      );
  }
}
