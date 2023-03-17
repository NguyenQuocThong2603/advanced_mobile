import 'package:advanced_mobile/screens/courses/courses.dart';
import 'package:advanced_mobile/screens/history/history.dart';
import 'package:advanced_mobile/screens/setting/setting.dart';
import 'package:advanced_mobile/screens/tutors/tutors.dart';
import 'package:advanced_mobile/screens/upcoming/upcoming.dart';
import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final PageStorageBucket _bucket = PageStorageBucket();
  final listScreen = const <Widget> [
    TutorsScreen(),
    CoursesScreen(),
    UpcomingScreen(),
    HistoryScreen(),
    SettingScreen(),

  ];
  var curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => curIndex = index),
          type: BottomNavigationBarType.fixed,
          currentIndex: curIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: 'Tutors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_builder_rounded),
              label: 'Upcoming',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ]),
      body: PageStorage(
        bucket: _bucket,
        child: listScreen[curIndex],
      ),
    );
  }
}
