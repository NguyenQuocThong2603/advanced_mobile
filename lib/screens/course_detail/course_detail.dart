import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/screens/topic_detail/topic_detail.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: const Text('Caring for our Planet',style: TextStyle(color: Colors.black),),
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
            const Image(
              image: NetworkImage('https://camblycurriculumicons.s3.amazonaws.com/5e2b99f70f8f1e9f625e8317?h=d41d8cd98f00b204e9800998ecf8427e'),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overview',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Text("Let's discuss how technology is changing the way we live",style: TextStyle(color: AppColors.textGrey),),
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
                    child: const Text("Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.",
                      style: TextStyle(height: 1.3),
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
                    child: const Text("You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.",
                      style: TextStyle(height: 1.3),
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
                        const Text("Intermediate",
                          style: TextStyle(fontSize: 16),
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
                        const Text("9 topics",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const Text('Topics',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
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
                                  children: const [
                                    Text('1.',style: TextStyle(fontSize: 25),),
                                    Text('Recycling for Sustainability',
                                      style: TextStyle(fontSize: 25),
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
}
