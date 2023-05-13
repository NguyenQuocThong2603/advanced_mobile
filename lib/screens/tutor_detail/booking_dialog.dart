import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog({
    Key? key,
    required this.bookedDate,
    required this.tutorProvider,
    required this.tutorId
  }) : super(key: key);
  final DateTime bookedDate;
  final TutorProvider tutorProvider;
  final String tutorId;

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  late TextEditingController _noteController;
  bool isBooking = false;
  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }
  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).userInfo!;
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 400,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Booking details', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
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
            body: isBooking == false ? Container(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Booking time', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                    Container(
                      height: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffEEEAFF)
                      ),
                      margin: const EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                          DateFormat('HH:mm E, dd MM yyyy').format(widget.bookedDate),
                        style: const TextStyle(color: Color(0xff7766C7)),),
                    ),
                    const Text('Notes', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
                    Container(
                      margin: const EdgeInsets.only(top: 8,bottom: 16),
                      child: TextField(
                        controller: _noteController,
                        maxLines: 5,
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                        ),
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
                                await widget.tutorProvider.bookClass(widget.bookedDate, _noteController.text,context);
                                await widget.tutorProvider.getScheduleOfTutor(widget.tutorId, null, null,user, context);
                                setState(() {
                                  isBooking = true;
                                });
                              } catch(error){
                                showErrorToast('Error: Something went wrong, please try later!');
                              }
                            },
                            child: const Text('Book'))
                      ],
                    )
                  ],
                ),
              ),
            ) : Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Image(
                    image: AssetImage('asset/img/check.png'),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 32,),
                  const Text('Booking success', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text('Done')
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
