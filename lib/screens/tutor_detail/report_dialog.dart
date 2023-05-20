import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ReportDialog extends StatefulWidget {
  const ReportDialog({
    Key? key,
    required this.tutorName,
    required this.tutorId,
    required this.tutorProvider
  }) : super(key: key);

  final String tutorName;
  final String tutorId;
  final TutorProvider tutorProvider;

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  late TextEditingController _reasonController;
  bool isEmpty = true;
  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController();
  }
  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 350,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                '${S.of(context).report} ${widget.tutorName}',
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
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.error,color: AppColors.primary,),
                        const SizedBox(width: 4,),
                        Text(
                          S.of(context).helpUsUnderstand,
                           style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                        ),
                      ]
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8,bottom: 16),
                      child: TextField(
                        controller: _reasonController,
                        maxLines: 6,
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          hintText: S.of(context).reportReasonHint
                        ),
                        onChanged: (value){
                          if(_reasonController.text != ""){
                            setState(() {
                              isEmpty = false;
                            });
                          }
                          else{
                            setState(() {
                              isEmpty = true;
                            });
                          }
                        },
                      ),),
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
                                await widget.tutorProvider.reportTutor(widget.tutorId, _reasonController.text, context);
                                showSuccessToast(S.of(context).reportSuccess);
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
            )
          ),
        )
    );
  }
}
