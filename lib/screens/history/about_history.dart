import 'package:advanced_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutHistory extends StatelessWidget {
  const AboutHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "asset/svg/history.svg",
          height: 150,
          width: 150,
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Column(
            children: [
              Text(S.of(context).theFollowingIsAList, style: TextStyle(color: Theme.of(context).hintColor),),
              const SizedBox(height: 8,),
              Text(S.of(context).youCanReviewTheDetails,style: TextStyle(color: Theme.of(context).hintColor),)
            ],
          ),
        )
      ],
    );
  }
}
