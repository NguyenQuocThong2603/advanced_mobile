import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/models/user/learn_topic.dart';
import 'package:advanced_mobile/models/user/test_preparation_model.dart';
import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile/config/countries.dart';
import 'package:intl/intl.dart';


class DetailInfo extends StatefulWidget {
  const DetailInfo({
    Key? key,
    required this.userProvider,
    required this.avaPath
  }) : super(key: key);
  final UserProvider userProvider;
  final String? avaPath;

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  late TextEditingController nameInputController;
  late TextEditingController phoneNumberInputController;
  late TextEditingController birthDayInputController;
  late TextEditingController scheduleInputController;
  late List<int> learnTopics;
  late List<int> testPreparations;
  late String birthday;
  late String? countryCode;
  late String? level;

  @override
  void initState() {
    super.initState();
    nameInputController = TextEditingController();
    phoneNumberInputController = TextEditingController();
    birthDayInputController = TextEditingController();
    scheduleInputController = TextEditingController();
    nameInputController.text = widget.userProvider.userInfo!.name;
    phoneNumberInputController.text = widget.userProvider.userInfo!.phone ?? "" ;
    scheduleInputController.text = widget.userProvider.userInfo!.studySchedule ?? "";
    learnTopics = widget.userProvider.userInfo!.learnTopics!.map((e) => e.id).toList();
    testPreparations = widget.userProvider.userInfo!.testPreparations!.map((e) => e.id).toList();
    birthday = widget.userProvider.userInfo!.birthday ?? "" ;
    countryCode = widget.userProvider.userInfo!.country;
    level = widget.userProvider.userInfo!.level;
  }
  @override
  void dispose() {
    nameInputController.dispose();
    phoneNumberInputController.dispose();
    birthDayInputController.dispose();
    scheduleInputController.dispose();
    super.dispose();
  }

  bool checkIsSelectedLearnTopic(value){
    return learnTopics.any((element) => element == value);
  }

  bool checkIsSelectedTestPreparation(value){
    return testPreparations.any((element) => element == value);

  }

  @override
  Widget build(BuildContext context) {
    User userInfo = widget.userProvider.userInfo!;
    final listLearnTopic = learnTopicsMapping.map((e) => LearnTopic.fromJson(e)).toList();
    final listTestPreparation = testPreparationMapping.map((e) => TestPreparation.fromJson(e)).toList();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('Name'),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                child: TextField(
                  controller: nameInputController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.black12)
                    ),
                    isDense: true,
                  )
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('Country'),
                ],
              ),
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
                      offset: Offset(0, 0)
                    ),
                    value: countryCode,
                    isExpanded: true,
                    iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value)  {
                      countryCode = value;
                      setState(() {
                        countryCode;
                      });
                    },
                    items: countriesMapping.entries.map((e){
                      return DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('Phone Number'),
                ],
              ),              Container(
                color: Colors.grey[200],
                margin: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: phoneNumberInputController,
                  enabled: false,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.black12)
                    ),
                    isDense: true,
                  )
                ),
              ),
              userInfo.isPhoneActivated == true ? Container(
                margin: const EdgeInsets.only(top: 8, bottom: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xfff6ffed),
                  border: Border.all(color: Colors.green)
                ),
                child:const Text('Verified',style:  TextStyle(color: Colors.green),)
              ): const SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('Birthday'),
                ],
              ),              GestureDetector(
                onTap: () async{
                  DateTime? newBirthDay = await showDatePicker(
                      context: context,
                      initialDate: userInfo.birthday != null ?
                      DateTime.parse(userInfo.birthday!) : DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if(newBirthDay != null) {
                    birthday = DateFormat('yyyy-MM-dd').format(newBirthDay);
                    setState(() {
                      birthday;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  margin: const EdgeInsets.only(top: 4, bottom: 16),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: Colors.black26)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(birthday),
                      const Icon(Icons.date_range,color: Colors.grey,)
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('My Level'),
                ],
              ),
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
                    value: level,
                    isExpanded: true,
                    iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? value) async {
                      level = value;
                      setState(() {
                        level;
                      });
                    },
                    items: userLevelsMap.entries.map((e){
                      return DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                  const Text('Want to learn'),
                ],
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: [
                  for(int i= 0;i<listTestPreparation.length;i++)
                    FilterChip(
                      label: Text(listTestPreparation[i].name),
                      selectedColor: AppColors.chipSelectedBackground,
                      backgroundColor: const Color(0xffe4e6eb),
                      onSelected: (value){
                        if(value == true){
                          testPreparations.add(listTestPreparation[i].id);
                        }
                        else{
                          testPreparations.remove(listTestPreparation[i].id);
                        }
                        setState(() {
                          testPreparations;
                        });
                      },
                      selected: checkIsSelectedTestPreparation(listTestPreparation[i].id),
                    ),
                  for(int i= 0;i<listLearnTopic.length;i++)
                    FilterChip(
                      label: Text(listLearnTopic[i].name),
                      selectedColor: AppColors.chipSelectedBackground,
                      backgroundColor:  const Color(0xffe4e6eb),
                      onSelected: (value){
                        if(value == true){
                          learnTopics.add(listLearnTopic[i].id);
                        }
                        else{
                          learnTopics.remove(listLearnTopic[i].id);
                        }
                        setState(() {
                          learnTopics;
                        });
                      },
                      selected: checkIsSelectedLearnTopic(listLearnTopic[i].id),
                    ),
                ],
              ),
              const Text('Study schedule'),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: Colors.black26)
                ),
                child: TextField(
                  controller: scheduleInputController,
                  maxLines: 4,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Note the time of the week you want to study on LetTutor"
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async{
                      try{
                        final futures = <Future<void>>[];
                        futures.add(widget.userProvider.updateUserInfo(birthday,
                            countryCode, learnTopics, level,
                            nameInputController.text, phoneNumberInputController.text,
                            scheduleInputController.text, testPreparations, context));
                        if(widget.avaPath !=null ){
                          futures.add(widget.userProvider.uploadAvatar(widget.avaPath, context));
                        }
                        await Future.wait(futures);
                        await widget.userProvider.getUserInfo(context);
                        showSuccessToast('Edit profile successful');
                      } catch(err){
                        showErrorToast(err);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                    child: const Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),)
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
