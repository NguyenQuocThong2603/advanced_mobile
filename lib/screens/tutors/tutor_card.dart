import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/countries.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/screens/tutor_detail/tutor_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({
    Key? key,
    required this.tutor,
    required this.listSpeciality,
    required this.tutorProvider,
    required this.speciality
  }) : super(key: key);

  final Tutor tutor;
  final List<String> listSpeciality;
  final TutorProvider tutorProvider;
  final String speciality;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white70, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [BoxShadow(blurRadius: 1)]),
            child: Material(
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TutorDetailScreen(tutorId: widget.tutor.userId)))
                  .then((value) async => await widget.tutorProvider.getListTutors(widget.speciality, context));
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                  child: Image(
                                    image: NetworkImage(
                                      widget.tutor.avatar!),
                                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                      return ClipRRect(
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                                          )
                                      );
                                    },
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                              )),
                          Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 16,bottom: 4),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(widget.tutor.name!, style: const TextStyle(fontSize: 16),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(widget.tutor.rating!.toStringAsFixed(2), style: const TextStyle(color: Colors.pink,fontSize: 16)),
                                              Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                            ],
                                          )
                                        ]
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        countriesMapping[widget.tutor.country] !=null ? Text(countriesMapping[widget.tutor.country]!)
                                          : Text(widget.tutor.country!),
                                        widget.tutor.isFavorite == true ? const Icon( Icons.favorite, color: Colors.red,size: 28,) :
                                        const Icon( Icons.favorite_border,size: 28,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      itemCount: widget.listSpeciality.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){
                                        return mappingSpecialities[widget.listSpeciality[index]] != null ?
                                        Container(
                                            margin: const EdgeInsets.only(
                                                right: 8),
                                            child: ChoiceChip(
                                              side: const BorderSide(color: Colors.blue, width: 0.2),
                                              label: Text(
                                                mappingSpecialities[widget.listSpeciality[index]]!,
                                                style: TextStyle(
                                                    color: AppColors.chipSelectedText,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              selected: true,
                                              selectedColor: AppColors.chipSelectedBackground,
                                              onSelected: (value) {},
                                            )
                                        ): Container();
                                      },
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          widget.tutor.bio!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
