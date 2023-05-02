import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
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
              title: Text('Report ${widget.tutorName}', style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
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
              backgroundColor: Colors.white,
              elevation:0,
            ),
            body: Container(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Reasons', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
                    Container(
                      margin: const EdgeInsets.only(top: 8,bottom: 16),
                      child: TextField(
                        controller: _reasonController,
                        maxLines: 6,
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          hintText: "Please let us know details about your problem"
                        ),
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 16,),
                        ElevatedButton(
                            onPressed: () async{
                              try{
                                if(_reasonController.text == ""){
                                  showErrorToast('Error: Please input reason');
                                } else{
                                  await widget.tutorProvider.reportTutor(widget.tutorId, _reasonController.text, context);
                                  showSuccessToast('Report successfully');
                                  Navigator.pop(context);
                                }
                              } catch(error){
                                print(error);
                                showErrorToast('Error: Something went wrong, please try later!');
                              }
                            },
                            child: const Text('Submit'))
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
