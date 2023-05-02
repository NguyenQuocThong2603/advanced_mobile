import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget regionBuilder(BuildContext context, TimeRegionDetails timeRegionDetails){
  String? text = timeRegionDetails.region.text;
  if(text == 'Booked'){
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text('Booked', style: TextStyle(color: Colors.green, fontSize: 12),),
    );
  }
  if(text == 'Reserved'){
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Reserved', style: TextStyle(color: AppColors.textGrey, fontSize: 12),),
    );
  }
  if(text == 'Book'){
    return Container(
      alignment: Alignment.center,
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('Book',
          style: TextStyle(color: Colors.white, fontSize: 12),),
      ),
    );
  }

  if(text == 'Can not book'){
    return Container(
      alignment: Alignment.center,
      child: Container(
          width: 40,
          alignment: Alignment.center,
          height: 30,
          decoration: BoxDecoration(
              borderRadius:  const BorderRadius.all(Radius.circular(20)),
              color: const Color(0xffe4e6eb),
              border: Border.all(style: BorderStyle.solid,width: 0.2)
          ),
          child: Text('Book',
            style: TextStyle(color: AppColors.textGrey, fontSize: 12),)
      ),
    );
  }

  return Container();
}