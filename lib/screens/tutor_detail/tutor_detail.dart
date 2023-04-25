import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/screens/tutor_detail/general_information.dart';
import 'package:advanced_mobile/screens/tutor_detail/specification_information.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({
    videoPlayerController,
    Key? key
  }) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network("https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4");
    await _videoPlayerController.initialize().then((value) => setState(() {}));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      showOptions: false,
      autoPlay: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    final aspectRatio = _videoPlayerController.value.isInitialized ? _videoPlayerController.value.aspectRatio : 3/2;
    print('aspectRatio: ${aspectRatio}');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: Colors.black,size: 30,)
            ),
            Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text('Abby',style: TextStyle(color: Colors.black),)
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
                  aspectRatio: aspectRatio,
                  child: _chewieController!=null ? Chewie(controller: _chewieController as ChewieController) : Container(),
                ),
              ),
              const GeneralInformation(),
              const SpecificationInformation(),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: SfCalendar(
                  view: CalendarView.week,
                  timeSlotViewSettings: const TimeSlotViewSettings(
                      startHour: 9.5,
                      endHour: 16.5,
                      timeInterval: Duration(minutes: 30),
                      timeFormat: 'hh:mm'
                  ),
                  showNavigationArrow: true,
                  viewNavigationMode: ViewNavigationMode.none,
                ),
              ),
              const Text('Rating and Comment(0)', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                            child: const Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/147/147133.png',
                                    scale: 8))
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
                                        const SizedBox(
                                            width: 150,
                                            child: Text('Nguyễn Quốc Thông', style: TextStyle(fontSize: 14),)
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center ,
                                          children: [
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
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
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          child: const Text(
                              'This tutor is so good!'
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Mon, 3/14/2023 12:35 AM',
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
