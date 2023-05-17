import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/models/user/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.feedback
  }) : super(key: key);

  final FeedBack feedback;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black26,
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              blurRadius: 1,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                      child: Image(
                        image: NetworkImage(
                            feedback.firstInfo.avatar,
                            scale: 6),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                              )
                          );
                        },
                      ),
                    ),
                ),
                Expanded(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: Text(feedback.firstInfo.name, style: const TextStyle(fontSize: 14),)
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center ,
                                  children: [
                                    for (int i =0; i < feedback.rating;i++)
                                      Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                  ],
                                )
                              ]
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
            feedback.content !="" ? Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16,bottom: 16,left: 8),
                  child:  Text(
                      feedback.content
                  ),
                ),
              ],
            ) : const SizedBox(height: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd hh:mm').format(DateTime.parse(feedback.createdAt)),
                  style: TextStyle(color: AppColors.textGrey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
