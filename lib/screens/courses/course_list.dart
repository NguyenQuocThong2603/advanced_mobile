import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CourseDetailScreen()));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 6, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://camblycurriculumicons.s3.amazonaws.com/5e2b99f70f8f1e9f625e8317?h=d41d8cd98f00b204e9800998ecf8427e'),),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Caring for Our Planet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 40),
                          child: const Text('Let\'s discuss our relationship as humans with our planet, Earth',
                              style: TextStyle(color: Color(0xff808080)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                          ),
                      ),
                      Row(
                        children: const [
                          Text('Intermediate • ', style: TextStyle(fontSize: 16),),
                          Text('7 lesson',style: TextStyle(fontSize: 16),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CourseDetailScreen()));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 6, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://camblycurriculumicons.s3.amazonaws.com/5e2b99f70f8f1e9f625e8317?h=d41d8cd98f00b204e9800998ecf8427e'),),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Caring for Our Planet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 40),
                        child: const Text('Let\'s discuss our relationship as humans with our planet, Earth',
                          style: TextStyle(color: Color(0xff808080)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: const [
                          Text('Intermediate • ', style: TextStyle(fontSize: 16),),
                          Text('7 lesson',style: TextStyle(fontSize: 16),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]
    );
  }
}
