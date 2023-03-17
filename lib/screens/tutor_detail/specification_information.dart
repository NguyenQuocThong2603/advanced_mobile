import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class SpecificationInformation extends StatelessWidget {
  const   SpecificationInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Languages', style: TextStyle(
            color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text('Education', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: const Text('on-going Bachelor of International Business, IELTS certicificate',
            style: TextStyle(color: Color(0xff787878)),
          ),
        ),
        const Text('Experience', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: const Text('Acadsoc - English Language Instruction Chinese based online English teaching platform. I taught EILTS as well as a wide age range of Children and adults of all levels. Sincewin - English Language Instruction Online English lessons for whole kindergarten classes. I taught basic phonics and vocabulary using songs, TPR and puppets',
            style: TextStyle(color: Color(0xff787878)),
          ),
        ),
        const Text('Interests', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: const Text('Acadsoc - English Language Instruction Chinese based online English teaching platform. I taught EILTS as well as a wide age range of Children and adults of all levels. Sincewin - English Language Instruction Online English lessons for whole kindergarten classes. I taught basic phonics and vocabulary using songs, TPR and puppets',
            style: TextStyle(color: Color(0xff787878)),
          ),
        ),
        const Text('Professions', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: const Text('Acadsoc - English Language Instruction Chinese based online English teaching platform. I taught EILTS as well as a wide age range of Children and adults of all levels. Sincewin - English Language Instruction Online English lessons for whole kindergarten classes. I taught basic phonics and vocabulary using songs, TPR and puppets',
            style: TextStyle(color: Color(0xff787878)),
          ),
        ),
        const Text('Specialities', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 6),
                  child: Chip(
                    label: Text('English',
                      style: TextStyle(color: Colors.blue[400]),),
                    backgroundColor: Colors.blue[50],
                    side: const BorderSide(color: Colors.blue, width: 0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text('Courses', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
          child: SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseDetailScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 200,
                              height: 160,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage('https://camblycurriculumicons.s3.amazonaws.com/5e2b99f70f8f1e9f625e8317?h=d41d8cd98f00b204e9800998ecf8427e'),),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text('Caring for Our Planet gdfgdfgdfgdfgfgdfghfghfghfghfgh',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Beginner'),
                                  Text('10 Lessons')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseDetailScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 200,
                              height: 160,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage('https://camblycurriculumicons.s3.amazonaws.com/5e2b99f70f8f1e9f625e8317?h=d41d8cd98f00b204e9800998ecf8427e'),),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text('Caring for Our Planet gdfgdfgdfgdfgfgdfghfghfghfghfgh',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Beginner'),
                                  Text('10 Lessons')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
