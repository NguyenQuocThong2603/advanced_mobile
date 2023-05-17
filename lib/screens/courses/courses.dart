import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/screens/courses/books_list.dart';
import 'package:advanced_mobile/screens/courses/course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}
class _CoursesScreenState extends State<CoursesScreen>{
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).courseTitle,
            ),
            automaticallyImplyLeading: false,
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
                            color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.white,
                          ),
                        ),
                        Text(
                          S.of(context).courseTitle,
                          style: TextStyle
                            (color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.white)
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
                          color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.white,
                        ),
                      ),
                      Text(
                        S.of(context).books,
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.white)
                        ,
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
              children: const [
                SizedBox(height: 15),
                Expanded(
                  child: TabBarView(
                      children:[
                        CourseList(),
                        BookList(),
                      ]
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
