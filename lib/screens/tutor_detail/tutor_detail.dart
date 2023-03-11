import 'package:advanced_mobile/screens/tutor_detail/general_information.dart';
import 'package:advanced_mobile/screens/tutor_detail/specification_information.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({Key? key}) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const[
            Icon(Icons.arrow_back, color: Colors.black,size: 30,),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              GeneralInformation(),
              SpecificationInformation()
            ],
          ),
        ),
      ),
    );
  }
}
