import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/screens/tutor_detail/tutor_detail.dart';
import 'package:advanced_mobile/screens/tutors/dropdown_menu.dart';
import 'package:advanced_mobile/screens/tutors/search_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

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
                      return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white70, width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [BoxShadow(blurRadius: 1)]),
                              child: Material(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorDetailScreen()));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(right: 8),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                                    child: Image(
                                                      image: NetworkImage(
                                                        tutors[0].avatar!,),
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    )
                                                )),
                                            Expanded(
                                                child:Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(bottom: 4),
                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(tutors[index].name!, style: const TextStyle(fontSize: 16),),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(tutors[index].rating!.toStringAsFixed(2), style: const TextStyle(color: Colors.pink,fontSize: 16)),
                                                                Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                                                              ],
                                                            )
                                                          ]
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      child: ListView.builder(
                                                        itemCount: listSpeciality.length,
                                                        scrollDirection: Axis.horizontal,
                                                        itemBuilder: (context,index){
                                                          return mappingSpecialities[listSpeciality[index]] != null ?
                                                          Container(
                                                              margin: const EdgeInsets.only(
                                                                  right: 8),
                                                              child: ChoiceChip(
                                                                side: const BorderSide(color: Colors.blue, width: 0.2),
                                                                label: Text(
                                                                  mappingSpecialities[listSpeciality[index]]!,
                                                                  style: TextStyle(
                                                                      color: AppColors.chipSelectedText,
                                                                      fontWeight: FontWeight.w500),
                                                                ),
                                                                selected: true,
                                                                selectedColor: AppColors.chipSelectedBackground,
                                                                onSelected: (value) {},
                                                              )
                                                          ): Container();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            tutors[index].bio!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          )
                      );
                    },
                  ),
                )
          ]);
        },
      ),
    );
  }
}
