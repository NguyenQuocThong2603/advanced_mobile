import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  const CourseList({
    Key? key,
    required this.courses
  }) : super(key: key);

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: courses.length,
        itemBuilder: (context,index){
         return GestureDetector(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 CourseDetailScreen(courseId: courses[index].id,)));
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
                 SizedBox(
                   width: double.infinity,
                   child: AspectRatio(
                     aspectRatio: 2,
                     child: ClipRRect(
                       borderRadius: const BorderRadius.vertical(
                         top: Radius.circular(15),
                       ),
                       child: Image(
                         fit: BoxFit.cover,
                         image: NetworkImage(courses[index].imageUrl),),
                     ),
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.all(15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(courses[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                       Container(
                         margin: const EdgeInsets.only(top: 16, bottom: 40),
                         child: Text(courses[index].description,
                           style: const TextStyle(color: Color(0xff808080)),
                           overflow: TextOverflow.ellipsis,
                           maxLines: 2,
                         ),
                       ),
                       Row(
                         children: [
                           Text('${levelsMap[courses[index].level]} • ', style: const TextStyle(fontSize: 16),),
                           Text('${courses[index].lessons} lessons',style: const TextStyle(fontSize: 16),)
                         ],
                       )
                     ],
                   ),
                 )
               ],
             ),
           ),
         );
        }
    );
  }
}
