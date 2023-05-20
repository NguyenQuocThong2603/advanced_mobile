import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget regionBuilder(BuildContext context, TimeRegionDetails timeRegionDetails){
  String? text = timeRegionDetails.region.text;
  if(text == 'Booked'){
    return Container(
      alignment: Alignment.center,
      child: Text(S.of(context).booked, style: const TextStyle(color: Colors.green, fontSize: 8),),
    );
  }
  if(text == 'Reserved'){
    return Container(
      alignment: Alignment.center,
      child: Text(S.of(context).reserved, style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light ? AppColors.textGrey : Colors.white,
          fontSize: 8
      ),),
    );
  }
  if(text == 'Book'){
    return Container(
      alignment: Alignment.center,
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(S.of(context).book,
          style: const TextStyle(color: Colors.white, fontSize: 8),),
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
          child: Text(S.of(context).book,
            style: TextStyle(color: AppColors.textGrey, fontSize: 8),)
      ),
    );
  }

  return Container();
}