import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingBanner extends StatelessWidget {
  const UpcomingBanner({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingProvider>(
        builder: (context, upcomingProvider,_){
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            height: 160,
            color: const Color.fromRGBO(12, 61,223, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upcoming lesson',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    'Tue, 02 May 23 16:30 - 16:55 (starts in 00:32:03)',
                    style: TextStyle(color:Colors.white,fontSize: 16)
                  ),
                ),
                Text(
                  'Total lesson time is ${upcomingProvider.totalHour} hours ${upcomingProvider.totalMinute} minutes',
                  style: const TextStyle(color:Colors.white,fontSize: 14),
                )
              ],
            ),
          );
        }
    );
  }
}
