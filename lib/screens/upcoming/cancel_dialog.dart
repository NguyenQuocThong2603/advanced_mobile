import 'package:advanced_mobile/config/cancel_reasons.dart';
import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CancelDialog extends StatefulWidget {
  const CancelDialog({
    Key? key,
    required this.bookingInfo,
    required this.upcomingProvider
  }) : super(key: key);
  final BookingInfo bookingInfo;
  final UpcomingProvider upcomingProvider;
  @override
  State<CancelDialog> createState() => _CancelDialogState();
}

class _CancelDialogState extends State<CancelDialog> {
  int cancelReasonId = 0;
  late TextEditingController noteInputController;
  bool isSelectReason = false;
  @override
  void initState() {
    super.initState();
    noteInputController = TextEditingController();
  }
  @override
  void dispose() {
    noteInputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(widget.bookingInfo.scheduleDetailInfo!.startPeriodTimestamp);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: SizedBox(
        height: 650,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: AppColors.textGrey,)
                ),
              )
            ],
            automaticallyImplyLeading: false,
            elevation:0,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: 600,
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                        child: Image(
                          image: NetworkImage(
                              widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                                )
                            );
                          },
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      )
                  ),
                  Text(
                    widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(S.of(context).lessonTime)
                  ),
                  Text(
                    DateFormat('E, dd MMMM yyyy').format(startDate),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 2),
                          child: const Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.red,
                            size: 12,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            S.of(context).whatReasonTitle,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 16),
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.black26)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 200,
                          offset: Offset(0, 0),
                        ),
                        value: cancelReasonId != 0 ? cancelReasonId.toString() : null,
                        isExpanded: true,
                        iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                        onChanged: (value) {
                          setState(() {
                            cancelReasonId = int.parse(value!);
                            isSelectReason = true;
                          });
                        },
                        items: cancelReasonMapping(context).entries.map((e){
                          return DropdownMenuItem(
                            value: e.key,
                            child: Text(e.value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.black26)
                    ),
                    child: TextField(
                      controller: noteInputController,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          hintText: S.of(context).additionalNotes
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).cancel),
                      ),
                      const SizedBox(width: 16,),
                      ElevatedButton(
                          onPressed: () async{
                            try{
                              if(!isSelectReason){
                                showErrorToast('Error: ${S.of(context).reasonNotEmpty}');
                              }
                              else{
                                await widget.upcomingProvider.cancelClass(
                                    cancelReasonId,
                                    noteInputController.text,
                                    widget.bookingInfo.id,
                                    context
                                );
                                showSuccessToast(S.of(context).deleteBookingSuccess);
                                widget.upcomingProvider.removeUpcomingClasses();
                                await widget.upcomingProvider.getUpcomingClasses(
                                    1,
                                    widget.upcomingProvider.upComingCurrentLength,
                                    context
                                );
                                Navigator.pop(context);
                              }
                            } catch(error){
                              showErrorToast('Error: ${S.of(context).somethingWentWrong}');
                            }
                          },
                          child: Text(S.of(context).submit))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
