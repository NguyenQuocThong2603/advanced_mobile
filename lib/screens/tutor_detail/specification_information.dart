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
        const Text('Rating and Comment(0)', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1),fontSize: 16),),
      ],
    );
  }
}
