import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course
  }) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            CourseDetailScreen(courseId: course.id,)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.transparent,
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
                    image: NetworkImage(course.imageUrl),),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: course.categories.length,
                      itemBuilder: (context,index){
                          return Chip(
                              label: Text(
                                categoryMapping(context)[course.categories[index].id]!,
                                style: const TextStyle(color: Colors.black),)
                            ,
                            backgroundColor: Colors.blue[100],
                          );
                      }
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 40),
                    child: Text(course.description,
                      style: const TextStyle(color: Color(0xff808080)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Text('${levelsMap[course.level]} • ', style: const TextStyle(fontSize: 16),),
                      Text('${course.lessons} lessons',style: const TextStyle(fontSize: 16),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
