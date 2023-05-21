import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/course.provider.dart';
import 'package:advanced_mobile/screens/courses/course_card.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CourseList extends StatefulWidget {
  const CourseList({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<String> levelSelected = [];
  List<String> categorySelected = [];
  late TextEditingController searchInputController;
  int page = 1;
  int size = 10;
  late ScrollController scrollController;
  bool isLoadMore = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    context.read<CourseProvider>().removeCourses();
    searchInputController = TextEditingController();
    scrollController = ScrollController()..addListener(loadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<CourseProvider>().getListCourses(1,10,'',[],[],context);
    });
  }
  @override
  void dispose() {
    searchInputController.dispose();
    scrollController.removeListener(loadMore);
    scrollController.dispose();
    super.dispose();
  }

  void loadMore() async {
    if(isLoadMore){
      return;
    }
    if (!isLoadMore && scrollController.position.extentAfter < page * size) {
      if(context.read<CourseProvider>().courses.length < context.read<CourseProvider>().count){
        setState(() {
          isLoadMore = true;
          page++;
        });
        try {
          await context.read<CourseProvider>().getListCourses(page, size, name,levelSelected,categorySelected,context);
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
    return Consumer<CourseProvider>(
      builder: (context, courseProvider,_) {
        return Column(
          children: [
            TextField(
              controller: searchInputController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: S.of(context).searchCourses),
                onSubmitted: (value) async {
                setState(() {
                  name = searchInputController.text;
                });
                courseProvider.removeCourses();
                await courseProvider.getListCourses(1, size, searchInputController.text,
                    levelSelected,categorySelected,context);
              },
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(right: 16),
              margin: const EdgeInsets.only(top: 4, bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.black26)
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      offset: Offset(0, 0),
                    ),
                    onChanged: (value) async {
                    },
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        S.of(context).selectLevel,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    value: levelSelected.isEmpty ? null : levelSelected.last,
                    items: levelsMap.entries.map((e){
                      return DropdownMenuItem(
                        value: e.key,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = levelSelected.contains(e.key);
                            return InkWell(
                              onTap: () async {
                                courseProvider.removeCourses();
                                isSelected
                                    ? levelSelected.remove(e.key)
                                    : levelSelected.add(e.key);
                                courseProvider.removeCourses();
                                await courseProvider.getListCourses(1, size, name,
                                    levelSelected,categorySelected,context);
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Text(
                                      e.value,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    selectedItemBuilder: (context) {
                      return levelsMap.entries.map((item) {
                          return Container(
                            alignment: AlignmentDirectional.center,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              levelSelected.map((value) => levelsMap[value]).toList().join(', '),
                              style: const TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          );
                        },
                      ).toList();
                    },                  )
              ),
            ),
            const SizedBox(width: 15,),
            Container(
              padding: const EdgeInsets.only(right: 16),
              margin: const EdgeInsets.only(top: 4, bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.black26)
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    onChanged: (value){

                    },
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        S.of(context).selectCategory,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      offset: Offset(0, 0),
                    ),
                    value: categorySelected.isEmpty ? null : categorySelected.last,
                    items: categoryMapping(context).entries.map((e){
                      return DropdownMenuItem(
                        value: e.key,
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = categorySelected.contains(e.key);
                            return InkWell(
                              onTap: () async {
                                courseProvider.removeCourses();
                                isSelected
                                    ? categorySelected.remove(e.key)
                                    : categorySelected.add(e.key);
                                courseProvider.removeCourses();
                                await courseProvider.getListCourses(1, size, name,
                                    levelSelected, categorySelected, context);
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Text(
                                      e.value,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    selectedItemBuilder: (context) {
                      return categoryMapping(context).entries.map((item) {
                        return Container(
                          alignment: AlignmentDirectional.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            categorySelected.map((value) => categoryMapping(context)[value]).toList().join(', '),
                            style: const TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        );
                      },
                      ).toList();
                    },
                  )
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: courseProvider.courses.length,
                itemBuilder: (context,index){
                  return CourseCard(course: courseProvider.courses[index]);
                }
              ),
            ),
            if(isLoadMore)
              SpinKitRing(
                color: AppColors.primary,
                size: 50,
              )
          ],
        );
      }
    );
  }
}
