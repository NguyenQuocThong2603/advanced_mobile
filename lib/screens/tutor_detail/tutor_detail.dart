import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/screens/tutor_detail/comment._cart.dart';
import 'package:advanced_mobile/screens/tutor_detail/general_information.dart';
import 'package:advanced_mobile/screens/tutor_detail/specification_information.dart';
import 'package:advanced_mobile/utils/regionBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({
    videoPlayerController,
    Key? key,
    required this.tutorId,
  }) : super(key: key);
  final String tutorId;

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  late VideoPlayerController _videoPlayerController;
  final CalendarController _calendarController = CalendarController();
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<TutorProvider>().getTutorInformation(widget.tutorId, context);
      await context.read<TutorProvider>().getScheduleOfTutor(widget.tutorId,null,null,context);
      await context.read<TutorProvider>().getFeedbacks(widget.tutorId, context);
      initializePlayer();});
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(context.read<TutorProvider>().tutorInfo!.video!);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      showOptions: false,
      autoPlay: true,
    );
    setState(() {
      _chewieController;
    });
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime minDate = DateTime(now.year,now.month,now.day).subtract(const Duration(seconds: 1));
    return Consumer<TutorProvider>(
      builder: (context, tutorProvider,_) {
        return tutorProvider.tutorInfo == null ?
        const Scaffold(
          body: Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin,
                strokeWidth: 2.0,
              ),
            ),
          ),
        ) : Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      tutorProvider.removeTutorInfo(context);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.black,size: 30,)
                ),
                Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(tutorProvider.tutorInfo!.user!.name,style: const TextStyle(color: Colors.black),)
                )
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: AspectRatio(
                      aspectRatio: 3/2,
                      child: _chewieController!=null ? Chewie(controller: _chewieController as ChewieController) : Container(),
                    ),
                  ),
                  GeneralInformation(tutor: tutorProvider.tutorInfo!,tutorProvider: tutorProvider,),
                  SpecificationInformation(tutor: tutorProvider.tutorInfo!),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: SfCalendar(
                      onTap: (CalendarTapDetails details) async {
                        DateTime date = details.date!;
                        await tutorProvider.bookClass(date, context);
                      },
                      showCurrentTimeIndicator: false,
                      specialRegions: tutorProvider.regions,
                      view: CalendarView.week,
                      firstDayOfWeek: now.weekday,
                      timeSlotViewSettings: const TimeSlotViewSettings(
                        timeInterval: Duration(minutes: 25),
                        timeFormat: 'hh:mm a',
                        timeIntervalWidth: 60,
                        timeIntervalHeight: 50
                      ),
                      showNavigationArrow: true,
                      viewNavigationMode: ViewNavigationMode.none,
                      timeRegionBuilder: regionBuilder,
                      minDate: DateTime(now.year,now.month,now.day),
                      controller: _calendarController,
                      onViewChanged: (ViewChangedDetails viewChangedDetails) {
                        SchedulerBinding.instance.addPostFrameCallback((duration) async {
                          DateTime firstDate = viewChangedDetails.visibleDates.first;
                          DateTime lastDate = viewChangedDetails.visibleDates.last;
                          await tutorProvider.getScheduleOfTutor(widget.tutorId, firstDate,lastDate, context);
                        });
                      },
                    ),
                  ),
                  Text(
                    'Rating and Comment(${tutorProvider.tutorInfo!.totalFeedback})',
                    style: const TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
                  for (int i =0;i<tutorProvider.feedbacks.length;i++)
                    CommentCard(feedback: tutorProvider.feedbacks[i]),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
