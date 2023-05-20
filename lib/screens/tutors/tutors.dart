import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/providers/upcoming_provider.dart';
import 'package:advanced_mobile/screens/tutors/dropdown_menu.dart';
import 'package:advanced_mobile/screens/tutors/search_field.dart';
import 'package:advanced_mobile/screens/tutors/tutor_card.dart';
import 'package:advanced_mobile/screens/tutors/upcoming_banner.dart';
import 'package:advanced_mobile/widgets/toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorsScreen> createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen>
    with AutomaticKeepAliveClientMixin{
  int selectedIndex = 0;
  late TextEditingController searchInputController;
  bool isLoading = true;
  int page = 1;
  int perPage = 12;
  late ScrollController scrollController;
  bool isLoadMore = false;
  String name = "";
  String nationality = "None";

  @override
  void initState(){
    super.initState();
    searchInputController = TextEditingController();
    scrollController = ScrollController()..addListener(loadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      context.read<TutorProvider>().removeState();
      await context.read<UpcomingProvider>().getUpcomingClasses(1,10,false,context);
      await context.read<UpcomingProvider>().getTotalLessonTime(context);
      await context.read<TutorProvider>().searchTutorByName('',specialities(context)[selectedIndex]['key']!,'None',1,
          perPage,false,context);
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  void dispose(){
    searchInputController.dispose();
    scrollController.removeListener(loadMore);
    scrollController.dispose();
    super.dispose();
  }

  void setFilter(nameInput, nationalityInput){
    setState(() {
      page = 1;
      name = nameInput;
      nationality = nationalityInput;
    });
  }

  @override
  bool get wantKeepAlive => true;

  void loadMore() async {
    if(isLoadMore){
      return;
    }
    if (!isLoadMore && scrollController.position.extentAfter < page * perPage) {
      if(context.read<TutorProvider>().tutors.length < context.read<TutorProvider>().count){
        setState(() {
          isLoadMore = true;
          page++;
        });
        try {
          await context.read<TutorProvider>().searchTutorByName(name,specialities(context)[selectedIndex]['key']!,nationality,
              page,perPage,false,context);
          if (mounted) {
            setState(() {
              isLoadMore = false;
            });
          }
        } catch (e) {
          showErrorToast("Error: Can't load more");
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tutors,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: isLoading ? SpinKitRing(
        color: AppColors.primary,
        size: 50,
      ) : Consumer<TutorProvider> (
        builder: (context,tutorProvider,_) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<UpcomingProvider>(
                  builder: (context, upcomingProvider,_) {
                    return UpcomingBanner(upcomingClasses: upcomingProvider.upcomingClasses,upcomingProvider: upcomingProvider,);
                  }
                ),
                SearchField(
                    speciality: specialities(context)[selectedIndex]['key']!,
                    tutorProvider: tutorProvider,
                    setFilter: setFilter,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20,top: 4,bottom: 8),
                  child: Text(
                    S.of(context).enterNationality,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                NationalitiesMenu(
                  speciality: specialities(context)[selectedIndex]['key']!,
                  name: searchInputController.text,
                  nationalities: tutorProvider.nationalities(context),
                  tutorProvider: tutorProvider,
                  setFilter: setFilter,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: specialities(context).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                onSelected: (value) async {
                                  if(selectedIndex != index){
                                    selectedIndex = index;
                                    tutorProvider.removeState();
                                    await tutorProvider.searchTutorByName(
                                      name,
                                      specialities(context)[selectedIndex]['key']!,nationality,
                                      1,perPage,true,context)
                                    ;
                                    setState(() {
                                      page = 1;
                                      selectedIndex;
                                    });
                                  }
                                },
                                label: Text(
                                  specialities(context)[index]['name']!,
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
                if(tutorProvider.isLoading)
                  Expanded(
                    child: Center(
                      child: SpinKitRing(
                        color: AppColors.primary,
                        size: 50,
                      ),
                    ),
                  )
                else
                  tutorProvider.tutors.isNotEmpty ? Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: tutorProvider.tutors.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index){
                        var tutors = tutorProvider.tutors;
                        var listSpeciality = tutors[index].specialties.split(',');
                        return TutorCard(
                          tutor: tutors[index],
                          listSpeciality: listSpeciality,
                          tutorProvider: tutorProvider,
                          speciality: specialities(context)[selectedIndex]['key']!,
                          setFilter: setFilter,
                          name: name,
                          nationality: nationality,
                          page: page,
                          perPage: perPage
                        );
                      },
                    ),
                  ) : const Expanded(
                    child: Center(
                      child: Image(
                        height: 200,
                        width: 300,
                        image: AssetImage('asset/img/no-data-found.png'),
                      ),
                    ),
                  ),
                if(isLoadMore)
                  SpinKitRing(
                    color: AppColors.primary,
                    size: 50,
                  )
              ]
          );
        },
      ),
    );
  }
}
