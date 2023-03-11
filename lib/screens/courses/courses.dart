import 'package:advanced_mobile/screens/courses/course_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}
class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Courses',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: SvgPicture.asset(
                            "asset/svg/course.svg",
                            width: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          'Courses',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          "asset/svg/book.svg",
                          width: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 15),
                TextField(
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          hintText: "Search Courses")),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      CourseItem(),
                      CourseItem(),
                      CourseItem(),
                      CourseItem(),
                      CourseItem(),
                      CourseItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
