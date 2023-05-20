import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/screens/upcoming/about_upcoming.dart';
import 'package:advanced_mobile/screens/video_call/video_call.dart';
import 'package:advanced_mobile/utils/booking_info_utils.dart';
import 'package:advanced_mobile/utils/formatDateFromTimestamp.dart';
import 'package:advanced_mobile/utils/show_dialog.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  int page = 1;
  int perPage = 10;
  late ScrollController scrollController;
  bool isLoadMore = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(loadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<UpcomingProvider>().refreshUpcomingClasses();
      await context.read<UpcomingProvider>().getUpcomingClasses(1,10,false,context);
    });
  }
  @override
  void dispose() {
    scrollController.removeListener(loadMore);
    scrollController.dispose();
    super.dispose();
  }
  void loadMore() async {
    if(isLoadMore){
      return;
    }
    if (!isLoadMore && scrollController.position.extentAfter < context.read<UpcomingProvider>().upcomingClasses.length) {
      if(context.read<UpcomingProvider>().upComingCurrentLength
          < context.read<UpcomingProvider>().upComingCount){
        setState(() {
          isLoadMore = true;
          page++;
        });
        try {
          await context.read<UpcomingProvider>().getUpcomingClasses(
              page,
              perPage,
              false,
              context
          );
          if (mounted) {
            setState(() {
              isLoadMore = false;
            });
          }
        } catch (e) {
          showErrorToast("Error: Can't load more");
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingProvider>(
      builder: (context, upcomingProvider,_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Upcoming',
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                const AboutUpComing(),
                const SizedBox(height: 16,),
                upcomingProvider.upcomingClasses.isEmpty ? const Expanded(
                  child: Center(
                    child: Image(
                      image: AssetImage('asset/img/no-data-found.png'),
                    ),
                  ),
                ) :
                Expanded(
                  child: ListView.builder(
                    itemCount: upcomingProvider.upcomingClasses.length,
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder:(context,index){
                      BookingInfo booking = upcomingProvider.upcomingClasses[index];
                      DateTime startDate = DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.startPeriodTimestamp);
                      DateTime endDate = DateTime.fromMillisecondsSinceEpoch(booking.scheduleDetailInfo!.endPeriodTimestamp);
                      Text requestWidget = Text(S.of(context).hintRequest,
                          style: TextStyle(color: AppColors.textGrey));
                      if(upcomingProvider.upcomingClasses[index].subBooking!.isNotEmpty){
                        List<String> requestList = upcomingProvider.upcomingClasses[index].subBooking!
                            .map((e) => e.studentRequest ?? "").toList();
                        List<String> finalRequest = requestList.where((element) => element !="").toList();
                        if(finalRequest.isNotEmpty){
                          String request = finalRequest.join('\n');
                          requestWidget = Text(request,);
                        }
                      }
                      else{
                        if(upcomingProvider.upcomingClasses[index].studentRequest !=null){
                          requestWidget = Text(upcomingProvider.upcomingClasses[index].studentRequest!,);
                        }
                      }
                      return Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.transparent,
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
                              for (int i = 0; i < booking.subBooking!.length;i++)
                                Container(
                                  margin: const EdgeInsets.only(left: 15, top: 8, right: 15),
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'Session ${i+1}: '
                                                '${formatDateFromTimestamp('HH:mm', booking.subBooking![i]
                                                .scheduleDetailInfo!.startPeriodTimestamp)} - '
                                                '${formatDateFromTimestamp('HH:mm', booking.subBooking![i]
                                                .scheduleDetailInfo!.endPeriodTimestamp)}'
                                        ),
                                      ),
                                      checkHideCancelButton(booking.subBooking![i]) ? Container() :
                                      OutlinedButton(
                                          onPressed: (){
                                            showCancelDialog(context, booking.subBooking![i], upcomingProvider);
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(color: Colors.red)
                                          ),
                                          child: Text(S.of(context).cancel,style: const TextStyle(color: Colors.red),)
                                      )
                                    ],
                                  ),
                                ),
                              Container(
                                margin: const EdgeInsets.only(left: 15,right: 15, top:8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: (Colors.grey[400] as Color)
                                  )
                                ),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 4,right: 4,left: 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(S.of(context).requestForLesson),
                                          TextButton(
                                              onPressed: (){
                                                showEditRequestDialog(context, booking, upcomingProvider,page,perPage);
                                              },
                                              child: Text(S.of(context).editRequest,)
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 4,left: 4,bottom: 16,top: 16),
                                      child: requestWidget
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    (booking.subBooking!.isNotEmpty || checkHideCancelButton(booking)) ? Container(): OutlinedButton(
                                        onPressed: (){
                                          showCancelDialog(context, booking, upcomingProvider);
                                        },
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(color: Colors.red)
                                        ),
                                        child: Text(S.of(context).cancel,style: const TextStyle(color: Colors.red),)
                                    ),
                                    ElevatedButton(
                                        onPressed: !checkDisableGoToMeeting(booking,upcomingProvider) ? (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  VideoCallScreen(upcomingProvider:upcomingProvider,upcomingClasses: upcomingProvider.upcomingClasses,)));
                                        } : null,
                                        child: Text(S.of(context).goToMeeting,style: const TextStyle(color: Colors.white),)
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
                ),
                if(isLoadMore)
                  SpinKitRing(
                    color: AppColors.primary,
                    size: 50,
                  )
              ],
            ),
          )
        );
      }
    );
  }
}
