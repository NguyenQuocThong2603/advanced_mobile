import 'package:advanced_mobile/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    required this.isResponse
  }) : super(key: key);

  final bool isResponse;
  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitThreeBounce(
      size: 20,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
        );
      },
    );
    if(isResponse){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text('Waiting for response',
              style: TextStyle(fontSize: 14, color: AppColors.primary),
            ),
          ),
          spinkit
        ],
      );
    }
    return Container();
  }
}
