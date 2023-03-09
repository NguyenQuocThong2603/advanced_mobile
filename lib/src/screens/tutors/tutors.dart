import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  handleOnSelected() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tutors',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.query_builder_rounded),
                label: 'Upcoming',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups),
                label: 'Tutors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ]),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
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
                    hintText: "Search Tutors")),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            'All',
                            style: TextStyle(
                                color: Colors.blue[500],
                                fontWeight: FontWeight.w700),
                          ),
                          selected: true,
                          selectedColor: Colors.blue[50],
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: const Text(
                            'English for Kids',
                            style: TextStyle(color: Color(0xff646464)),
                          ),
                          selected: false,
                          onSelected: (value) {},
                          backgroundColor: const Color(0xffe4e6eb),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: const Text(
                            'Conversational English',
                            style: TextStyle(color: Color(0xff646464)),
                          ),
                          selected: false,
                          onSelected: (value) {},
                          backgroundColor: const Color(0xffe4e6eb),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: const Text(
                            'Business English',
                            style: TextStyle(color: Color(0xff646464)),
                          ),
                          selected: false,
                          onSelected: (value) {},
                          backgroundColor: const Color(0xffe4e6eb),
                        )),
                  ],
                ),
              )),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  child:                 Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: const [BoxShadow(blurRadius: 1)]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: const Image(
                                          image: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/147/147133.png',
                                              scale: 8))
                                  ),
                                  Expanded(
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 4),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('Abby', style: TextStyle(fontSize: 16),),
                                                  Row(
                                                    children: const [
                                                      Text('5.00', style: TextStyle(color: Colors.pink,fontSize: 16)),
                                                      Icon(Icons.star_rate_rounded,color: Colors.yellow,)
                                                    ],
                                                  )
                                                ]
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                    margin: const EdgeInsets.only(
                                                        right: 4),
                                                    child: ChoiceChip(
                                                      side: const BorderSide(color: Colors.blue, width: 0.2),
                                                      label: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            color: Colors.blue.shade900,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            fontSize: 14),
                                                      ),
                                                      selected: true,
                                                      selectedColor:
                                                      const Color(0xffddeaff),
                                                    )),
                                                Container(
                                                    margin: const EdgeInsets.only(
                                                        right: 4),
                                                    child: ChoiceChip(
                                                      label: const Text(
                                                        'English for Kids',
                                                        style: TextStyle(
                                                            color: Color(0xff646464)),
                                                      ),
                                                      selected: false,
                                                      onSelected: (value) {},
                                                      backgroundColor:
                                                      const Color(0xffe4e6eb),
                                                    )),
                                                Container(
                                                    margin: const EdgeInsets.only(
                                                        right: 8),
                                                    child: ChoiceChip(
                                                      label: const Text(
                                                        'Conversational English',
                                                        style: TextStyle(
                                                            color: Color(0xff646464)),
                                                      ),
                                                      selected: false,
                                                      onSelected: (value) {},
                                                      backgroundColor:
                                                      const Color(0xffe4e6eb),
                                                    )),
                                                Container(
                                                    margin: const EdgeInsets.only(
                                                        right: 8),
                                                    child: ChoiceChip(
                                                      label: const Text(
                                                        'Business English',
                                                        style: TextStyle(
                                                            color: Color(0xff646464)),
                                                      ),
                                                      selected: false,
                                                      onSelected: (value) {},
                                                      backgroundColor:
                                                      const Color(0xffe4e6eb),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: const Text(
                                    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years.'
                                ),
                              )
                            ],
                          )
                      )
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
