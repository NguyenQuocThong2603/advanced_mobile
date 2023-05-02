import 'package:advanced_mobile/config/countries.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/utils/show_dialog.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    Key? key,
    required this.tutor,
    required this.tutorProvider
  }) : super(key: key);
  final Tutor tutor;
  final TutorProvider tutorProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                  child: Image(
                      image: NetworkImage(
                          tutor.user!.avatar,
                          scale: 6),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
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
                  ),
                )
            ),
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tutor.user!.name, style: const TextStyle(fontSize: 20),),
                      Row(
                        children: [
                          for(int i = 0; i< tutor.rating!.round();i++)
                            Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,)
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(tutor.profession, style: const TextStyle(color: Color(0xff787878)),),
                      ],
                    ),
                  ),
                  countriesMapping[tutor.user!.country!] !=null
                      ? Text(countriesMapping[tutor.user!.country!]!)
                      : Text(tutor.user!.country!)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      try{
                        await tutorProvider.manageFavoriteTutor(tutor.user!.id, context);
                      } catch(error){
                        showErrorToast('Error: Something went wrong, please try later!');
                      }
                    },
                    child: Column(
                      children: [
                        tutor.isFavouriteTutor != true ? const Icon(Icons.favorite_outline,color: Color.fromRGBO(0, 113, 240, 1),)
                            : const Icon(Icons.favorite,color: Colors.pink,),
                        Text('Favourite',
                          style: tutor.isFavouriteTutor != true ? const TextStyle(color: Color.fromRGBO(0, 113, 240, 1))
                                  : const TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      showReportDialog(context,tutor.user!.id,tutor.user!.name,tutorProvider);
                    },
                    child: Column(
                      children: const[
                        Icon(Icons.report, color: Color.fromRGBO(0, 113, 240, 1),),
                        Text('Report', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1)),)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            tutor.bio,
            style: const TextStyle(fontSize: 16, height: 1.3),
          ),
        ),
      ],
    );
  }
}
