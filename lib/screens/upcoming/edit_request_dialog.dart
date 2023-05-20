import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/schedule/booking_info_model.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';

class EditRequestDialog extends StatefulWidget {
  const EditRequestDialog({
    Key? key,
    required this.bookingInfo,
    required this.upcomingProvider,
    required this.page,
    required this.perPage
  }) : super(key: key);
  final BookingInfo bookingInfo;
  final UpcomingProvider upcomingProvider;
  final int page;
  final int perPage;
  @override
  State<EditRequestDialog> createState() => _EditRequestDialogState();
}

class _EditRequestDialogState extends State<EditRequestDialog> {
  late TextEditingController noteInputController;
  bool isEmpty = true;
  @override
  void initState() {
    super.initState();
    noteInputController = TextEditingController();
    noteInputController.text = widget.bookingInfo.studentRequest ?? '';
  }
  @override
  void dispose() {
    noteInputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: SizedBox(
        height: 340,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).specialRequest,
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
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
          body: Container(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
            child: SingleChildScrollView(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 2),
                          child: const Icon(
                            Icons.ac_unit_rounded,
                            color: Colors.red,
                            size: 12,
                          ),
                        ),
                        Text(S.of(context).note,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Colors.black26)
                      ),
                      child: TextField(
                        controller: noteInputController,
                        maxLines: 4,
                        style: const TextStyle(fontSize: 15),
                        onChanged: (value) {
                          if(value == ''){
                            setState(() {
                              isEmpty = true;
                            });
                          }
                          else{
                            setState(() {
                              isEmpty = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            hintText: S.of(context).wishTopic
                        ),
                      ),
                    ),
                    Text(S.of(context).youCanWriteEnglishOrVietnamese),
                    const SizedBox(height: 16,),
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
                            onPressed: isEmpty ? null : () async{
                              try{
                                await widget.upcomingProvider.editRequest(
                                    noteInputController.text,
                                    widget.bookingInfo.id,
                                    context
                                );
                                await widget.upcomingProvider.getUpcomingClasses(
                                    1,
                                    widget.upcomingProvider.upComingCurrentLength,
                                    true,
                                    context
                                );
                                Navigator.pop(context);
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
      ),
    );
  }
}
