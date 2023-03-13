import 'package:advanced_mobile/config/color.dart';
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
            children: [
              const GeneralInformation(),
              const SpecificationInformation(),
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
