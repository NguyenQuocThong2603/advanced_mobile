import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/models/schedule/class_review_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/utils/formatDateFromTimestamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<UpcomingProvider>().getHistory(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingProvider>(
      builder: (context,upcomingProvider,_) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.navigate_before, color: Colors.black,size: 30,)
                  ),            Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text(
                      'History',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: upcomingProvider.history.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder:(context,index){
                          BookingInfo booking = upcomingProvider.history[index];
                          DateTime startDate = DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.startPeriodTimestamp);
                          DateTime endDate = DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.endPeriodTimestamp);

                          Widget requestWidget = Text(
                              'No request for lesson',
                              style: TextStyle(color: AppColors.textGrey));

                          Widget reviewWidget = Text(
                              'Tutor have not reviewed yet',
                              style: TextStyle(color: AppColors.textGrey));

                          if(upcomingProvider.history[index].subBooking!.isNotEmpty){
                            List<String> requestList = upcomingProvider.history[index].subBooking!
                                .map((e) => e.studentRequest ?? "").toList();
                            List<String> finalRequest = requestList.where((element) => element !="").toList();
                            if(finalRequest.isNotEmpty){
                              String request = finalRequest.join('\n');
                              requestWidget = Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Request for lession',style: TextStyle(fontWeight: FontWeight.w500),),
                                  const SizedBox(height: 8,),
                                  Text(request,),
                                ],
                              );

                              List<ClassReview?> reviews = upcomingProvider.history[index].subBooking!
                                  .map((e) => e.classReview).toList();
                              final classReview = reviews.where((element) => element != null).toList();
                              reviewWidget = Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Review from tutor',style: TextStyle(fontWeight: FontWeight.w500),),
                                  for (int i = 0; i<classReview.length;i++)...[
                                    const SizedBox(height: 8,),
                                    Text('Session ${i+1}',style: const TextStyle(fontWeight: FontWeight.w500),),
                                    classReview[i]!.lessonStatus != null ? Row(
                                      children: [
                                        Text('Lesson status: ${classReview[i]!.lessonStatus!.status}'),
                                      ],
                                    ) : Container(),
                                    Row(
                                      children: [
                                        const Text('Behavior ('),
                                        for(int j =0; j<classReview[i]!.behaviorRating!;j++)
                                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                        Text('): ${classReview[i]!.behaviorComment}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('Listening ('),
                                        for(int j =0; j<classReview[i]!.listeningRating!;j++)
                                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                        Text('): ${classReview[i]!.listeningComment}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('Speaking ('),
                                        for(int j =0; j<classReview[i]!.speakingRating!;j++)
                                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                        Text('): ${classReview[i]!.speakingComment}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('Vocabulary ('),
                                        for(int j =0; j<classReview[i]!.vocabularyRating!;j++)
                                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                        Text('): ${classReview[i]!.vocabularyComment}')
                                      ],
                                    ),
                                    classReview[i]!.homeworkComment != "" ? Column(
                                      children: [
                                        const SizedBox(height: 4,),
                                        Text('Homework: ${classReview[i]!.homeworkComment}')
                                      ],) : Container(),
                                    const SizedBox(height: 4,),
                                    Text('Overall comment: ${classReview[i]!.overallComment}')
                                  ]
                                ],
                              );
                            }
                          }
                          else{
                            if(upcomingProvider.history[index].studentRequest !=null){
                              requestWidget = Text(upcomingProvider.history[index].studentRequest!,);
                            }
                            if(upcomingProvider.history[index].classReview !=null){
                              final classReview = upcomingProvider.history[index].classReview;
                              reviewWidget = Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Review from tutor',style: TextStyle(fontWeight: FontWeight.w500),),
                                      const SizedBox(height: 8,),
                                      const Text('Session 1',style: TextStyle(fontWeight: FontWeight.w500),),
                                      classReview!.lessonStatus != null ? Row(
                                        children: [
                                          Text('Lesson status: ${classReview.lessonStatus!.status}'),
                                        ],
                                      ) : Container(),
                                      Row(
                                        children: [
                                          const Text('Behavior ('),
                                          for(int j =0; j<classReview!.behaviorRating!;j++)
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                          Text('): ${classReview!.behaviorComment}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Listening ('),
                                          for(int j =0; j<classReview!.listeningRating!;j++)
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                          Text('): ${classReview!.listeningComment}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Speaking ('),
                                          for(int j =0; j<classReview!.speakingRating!;j++)
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                          Text('): ${classReview!.speakingComment}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Vocabulary ('),
                                          for(int j =0; j<classReview!.vocabularyRating!;j++)
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                          Text('): ${classReview!.vocabularyComment}')
                                        ],
                                      ),
                                      classReview!.homeworkComment != "" ? Column(
                                        children: [
                                          const SizedBox(height: 4,),
                                          Text('Homework: ${classReview!.homeworkComment}')
                                        ],) : Container(),
                                      const SizedBox(height: 4,),
                                      Text('Overall comment: ${classReview!.overallComment}')
                                  ]
                              );
                            }
                          }
                          return Container(
                            margin: const EdgeInsets.only(top: 16, bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12, width: 1),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                )
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(right: 8, left: 15),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                            child: Image(
                                              image: NetworkImage(
                                                  booking.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return ClipRRect(
                                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                                                    )
                                                );
                                              },
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(booking.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!),
                                          Container(
                                              margin: const EdgeInsets.symmetric(vertical: 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    DateFormat('E dd MMMM yyyy').format(startDate),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.all(2),
                                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.blue, width: 1), color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                                                    child: Text(
                                                      DateFormat('HH:mm').format(startDate),
                                                      style: const TextStyle(color: Colors.blue),),
                                                  ),
                                                  const Text("-"),
                                                  Container(
                                                    padding: const EdgeInsets.all(2),
                                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.orange, width: 1), color: Colors.orange[50], borderRadius: BorderRadius.circular(4)),
                                                    child: Text(
                                                      DateFormat('HH:mm').format(endDate),
                                                      style: const TextStyle(color: Colors.orange),),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 15,right: 15, top:8),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: (Colors.grey[400] as Color)
                                              )
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(8),
                                                  child: requestWidget
                                              ),
                                              Divider(
                                                height: 10,
                                                color: Colors.grey[500]
                                              ),
                                              Container(
                                                margin: const EdgeInsets.all(8),
                                                  child: reviewWidget
                                              )
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: (){},
                                            child: const Text('Add a rating',)
                                        ),
                                        TextButton(
                                            onPressed: (){},

                                            child: const Text('Report',)
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            )
        );
      }
    );
  }
}
