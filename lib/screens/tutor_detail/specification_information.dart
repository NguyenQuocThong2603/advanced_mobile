import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/config/countries.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class SpecificationInformation extends StatelessWidget {
  const SpecificationInformation({
    Key? key,
    required this.tutor
  }) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    var languages = tutor.languages.split(',');
    var specialities = tutor.specialties.split(',');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).languages, style: const TextStyle(
            color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: languages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: languagesMapping[languages[index]] != null
                        ? Text(languagesMapping[languages[index]]!['name']!,style: TextStyle(color: Colors.blue[400]))
                        : Text(languages[index],style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                    ),
                );
              },
            ),
          ),
        ),
        Text(S.of(context).experience, style: const TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: Text(tutor.experience,
            style: const TextStyle(color: Color(0xff787878)),
          ),
        ),
        Text(S.of(context).interests, style: const TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: Text(tutor.interests,
            style: const TextStyle(color: Color(0xff787878)),
          ),
        ),
        Text(S.of(context).specialities, style: const TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: specialities.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: mappingSpecialities(context)[specialities[index]] !=null ? Chip(
                    label: Text(mappingSpecialities(context)[specialities[index]]!,
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ) : Container(),
                );
              },
            ),
          ),
        ),
        Text(S.of(context).courses, style: const TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: tutor.user!.courses.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            CourseDetailScreen(courseId: tutor.user!.courses[index].id)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black26,
                          border: Border.all(color: Colors.black12, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              offset: Offset(2, 2),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(tutor.user!.courses[index].name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
