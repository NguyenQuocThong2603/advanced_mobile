import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/screens/tutors/dropdown_menu.dart';
import 'package:advanced_mobile/screens/tutors/search_field.dart';
import 'package:advanced_mobile/screens/tutors/tutor_card.dart';
import 'package:advanced_mobile/screens/tutors/upcoming_banner.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  int selectedIndex = 0;
  late TextEditingController searchInputController;

  @override
  void initState(){
    super.initState();
    searchInputController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<TutorProvider>().getListTutors(specialities[selectedIndex]['key']!, context);
      await context.read<UpcomingProvider>().getTotalLessonTime(context);
    });
  }
  @override
  void dispose(){
    searchInputController.dispose();
    super.dispose();
  }
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
      body: Consumer<TutorProvider> (
        builder: (context,tutorProvider,_) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpcomingBanner(),
                SearchField(
                    speciality: specialities[selectedIndex]['key']!,
                    tutorProvider: tutorProvider,),
                Container(
                  margin: const EdgeInsets.only(left: 20,top: 15,bottom: 8),
                  child: const Text(
                    'Select tutor nationality',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                NationalitiesMenu(
                  speciality: specialities[selectedIndex]['key']!,
                  name: searchInputController.text,
                  nationalities: tutorProvider.nationalities,
                  tutorProvider: tutorProvider,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: specialities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                onSelected: (value) async {
                                  if(selectedIndex != index){
                                    selectedIndex = index;
                                    await tutorProvider.getListTutors(specialities[selectedIndex]['key']!,context);
                                    setState(() {
                                      selectedIndex;
                                    });
                                  }
                                },
                                label: Text(
                                  specialities[index]['name']!,
                                  style: TextStyle(
                                      color: selectedIndex == index ? AppColors.chipSelectedText : AppColors.textGrey,
                                      fontWeight: FontWeight.w700),
                                ),
                                selected: selectedIndex == index,
                                selectedColor: AppColors.chipSelectedBackground,
                                backgroundColor:  const Color(0xffe4e6eb),
                              ));
                        },
                      ),
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: tutorProvider.tutors.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      var tutors = tutorProvider.tutors;
                      var listSpeciality = tutors[index].specialties.split(',');
                      return TutorCard(
                      tutor: tutors[index],
                      listSpeciality: listSpeciality,
                      tutorProvider: tutorProvider,
                      speciality: specialities[selectedIndex]['key']!,);
                    },
                  ),
                )
          ]);
        },
      ),
    );
  }
}
