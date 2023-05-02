import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/providers/course.provider.dart';
import 'package:advanced_mobile/screens/topic_detail/topic_detail.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({
    Key? key,
    required this.courseId
  }) : super(key: key);

  final String courseId;
  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<CourseProvider>().getCourseDetail(context,widget.courseId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
        builder: (context,courseProvider,_){
          Course? course = courseProvider.courseInfo;
          return course == null ?
          const Scaffold(
            body: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  strokeWidth: 2.0,
                ),
              ),
            ),
          ) :  Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.black,size: 30,)
                  ),            Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(
                      course.name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(course.imageUrl),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Overview',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Text(
                            course.description,
                            style: TextStyle(color: AppColors.textGrey),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 4),
                                child: const Icon(Icons.help_outline,color: Colors.pink,)
                            ),
                            const Text('Why take this course',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Text(course.reason,
                            style: const TextStyle(height: 1.3),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 4),
                                child: const Icon(Icons.help_outline,color: Colors.pink,)
                            ),
                            const Text('What will you be able to do',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Text(course.purpose,
                            style: const TextStyle(height: 1.3),
                          ),
                        ),
                        const Text('Experience Level',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  child: Icon(Icons.people_outline, color: AppColors.primary,)
                              ),
                               Text(levelsMap[course.level]!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Text('Course Length',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  child: Icon(Icons.topic, color: AppColors.primary,)
                              ),
                              Text("${course.lessons} topics",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Text('Topics',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        for(int i = 0; i < course.topics.length;i++)
                            Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Row(
                              children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black12, width: 1),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.4),
                                            offset: Offset(0, 3),
                                          )
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TopicDetailScreen()));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${i+1}.',style: const TextStyle(fontSize: 25),),
                                              Text(course.topics[i].name,
                                                style: const TextStyle(fontSize: 25),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
