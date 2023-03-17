import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/screens/tutor_detail/tutor_detail.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                            onSelected: (value) {},
                            label: Text(
                              'All',
                              style: TextStyle(
                                  color: AppColors.chipSelectedText,
                                  fontWeight: FontWeight.w700),
                            ),
                            selected: true,
                            selectedColor: AppColors.chipSelectedBackground,
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(
                              'English for Kids',
                              style: TextStyle(color: AppColors.textGrey),
                            ),
                            selected: false,
                            onSelected: (value) {},
                            backgroundColor: const Color(0xffe4e6eb),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(
                              'Conversational English',
                              style: TextStyle(color: AppColors.textGrey),
                            ),
                            selected: false,
                            onSelected: (value) {},
                            backgroundColor: const Color(0xffe4e6eb),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(
                              'Business English',
                              style: TextStyle(color: AppColors.textGrey),
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorDetailScreen()));
                    },
                    child: Container(
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
                                                      mainAxisAlignment: MainAxisAlignment.center ,
                                                      children: [
                                                        const Text('5.00', style: TextStyle(color: Colors.pink,fontSize: 16)),
                                                        Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
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
                                                              color: AppColors.chipSelectedText,
                                                              fontWeight: FontWeight.w500),
                                                        ),
                                                        selected: true,
                                                        selectedColor: AppColors.chipSelectedBackground,
                                                        onSelected: (value) {},
                                                      )),
                                                  Container(
                                                      margin: const EdgeInsets.only(
                                                          right: 4),
                                                      child: ChoiceChip(
                                                        side: const BorderSide(color: Colors.blue, width: 0.2),
                                                        label: Text(
                                                          'English for Kids',
                                                          style: TextStyle(
                                                              color: AppColors.chipSelectedText,
                                                              fontWeight: FontWeight.w500),
                                                        ),
                                                        selected: true,
                                                        selectedColor: AppColors.chipSelectedBackground,
                                                        onSelected: (value) {},
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
                                    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
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
          ]),
    );
  }
}
