import 'dart:convert';

import 'package:advanced_mobile/config/preference.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/user/token_model.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/screens/chat/chat.dart';
import 'package:advanced_mobile/screens/courses/courses.dart';
import 'package:advanced_mobile/screens/history/history.dart';
import 'package:advanced_mobile/screens/setting/setting.dart';
import 'package:advanced_mobile/screens/tutors/tutors.dart';
import 'package:advanced_mobile/screens/upcoming/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final PageStorageBucket _bucket = PageStorageBucket();
  final listScreen = const <Widget> [
    TutorsScreen(),
    CoursesScreen(),
    UpcomingScreen(),
    ChatScreen(),
    SettingScreen(),
  ];
  var curIndex = 0;

  List<Widget> buildScreen() => const [
    TutorsScreen(),
    CoursesScreen(),
    UpcomingScreen(),
    ChatScreen(),
    SettingScreen(),
  ];

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<UserProvider>().getUserInfo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider,_) {
        return Scaffold(
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (index) => setState(() => curIndex = index),
          //     type: BottomNavigationBarType.fixed,
          //     currentIndex: curIndex,
          //     items: <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(
          //         icon: const Icon(Icons.groups),
          //         label: S.of(context).tutors,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: const Icon(Icons.menu_book),
          //         label: S.of(context).courseTitle,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: const Icon(Icons.query_builder_rounded),
          //         label: S.of(context).upcoming,
          //       ),
          //       const BottomNavigationBarItem(
          //         icon: Icon(Icons.smart_toy),
          //         label: 'ChatGPT',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: const Icon(Icons.settings),
          //         label: S.of(context).settings,
          //       ),
          //     ]),
          bottomNavigationBar: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  height: 58,
                  width: MediaQuery.of(context).size.width / 5,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 5 * curIndex,
                    right: MediaQuery.of(context).size.width / 5 * (4 - curIndex),
                  ),
                ),
                BottomNavigationBar(
                    onTap: (index) => setState(() => curIndex = index),
                    type: BottomNavigationBarType.fixed,
                    currentIndex: curIndex,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.groups),
                        label: S.of(context).tutors,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.menu_book),
                        label: S.of(context).courseTitle,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.query_builder_rounded),
                        label: S.of(context).upcoming,
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.smart_toy),
                        label: 'ChatGPT',
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: S.of(context).settings,
                      ),
                    ]
                ),
              ]
          ),
          body: PageStorage(
            bucket: _bucket,
            child: listScreen[curIndex],
          ),
        );
      }
    );
  }
}
