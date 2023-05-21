import 'dart:developer';

import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/config/specialities.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/models/user/learn_topic.dart';
import 'package:advanced_mobile/models/user/test_preparation_model.dart';
import 'package:advanced_mobile/models/user/user_model.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/utils/validate_utils.dart';
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
  String? errorTextName;
  String? errorTextCountry;
  String? errorTextBirthday;
  String? errorTextLevel;
  String? errorTextWantToLearn;
  bool isWantToLearnEmpty = false;

  bool validateNameInput(value){
    final errorText = validateEmptyString(context, value,S.of(context).nameNotEmpty);
    setState(() {
      errorTextName = errorText;
    });
    bool a=errorText == null ? true : false;
    log('name: $a');
    return errorText == null ? true : false;
  }

  bool validateCountryInput(){
    String? errorText;
    if(countryCode == null){
      errorText = S.of(context).countryNotEmpty;
    }
    setState(() {
      errorTextCountry = errorText;
    });
    bool a=errorText == null ? true : false;
    log('country: $a');
    return errorText == null ? true : false;
  }

  bool validateBirthdayInput(){
    String? errorText;
    if(birthday == ''){
      errorText = S.of(context).birthdayNotEmpty;
    }
    setState(() {
      errorTextBirthday = errorText;
    });
    bool a=errorText == null ? true : false;
    log('birthday: $a');
    return errorText == null ? true : false;
  }
  bool validateLevelInput(){
    String? errorText;
    if(level == null){
      errorText = S.of(context).levelNotEmpty;
    }
    setState(() {
      errorTextLevel = errorText;
    });
    bool a=errorText == null ? true : false;
    log('level: $a');
    return errorText == null ? true : false;
  }
  bool validateWantToLearnInput(){
    if(learnTopics.isEmpty && testPreparations.isEmpty){
      isWantToLearnEmpty = true;
    }else{
      isWantToLearnEmpty = false;
    }
    setState(() {
      isWantToLearnEmpty;
    });
    log('wantToLearn: $isWantToLearnEmpty');
    return !isWantToLearnEmpty;
  }

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
    birthDayInputController.text = birthday;
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
                  Text(S.of(context).name),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                child: TextField(
                  controller: nameInputController,
                  onChanged: validateNameInput,
                  decoration: InputDecoration(
                    prefix: const Padding(padding: EdgeInsets.only(left: 16),),
                    contentPadding: const EdgeInsets.only(top: 10,bottom: 10, right: 16),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.black12)
                    ),
                    isDense: true,
                    errorText: errorTextName
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
                  Text(S.of(context).country),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      offset: Offset(0, 0)
                    ),
                    value: countryCode,
                    isExpanded: true,
                    iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                    onChanged: (value)  {
                      countryCode = value;
                      errorTextCountry = null;
                      setState(() {
                        countryCode;
                        errorTextCountry;
                      });
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
                      errorText: errorTextCountry,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.black26)
                      )
                    ),
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
                  Text(S.of(context).phoneNumber),
                ],
              ),
              Container(
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey[200] : Colors.grey[900],
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
                child: Text(S.of(context).verified,style: const TextStyle(color: Colors.green),)
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
                  Text(S.of(context).birthday),
                ],
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 16),
                  child: TextField(
                    onTap: () async{
                      DateTime? newBirthDay = await showDatePicker(
                          context: context,
                          initialDate: userInfo.birthday != null ?
                          DateTime.parse(userInfo.birthday!) : DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      if(newBirthDay != null) {
                        birthday = DateFormat('yyyy-MM-dd').format(newBirthDay);
                        birthDayInputController.text = birthday;
                        errorTextBirthday = null;
                        setState(() {
                          birthday;
                          errorTextBirthday;
                        });
                      }
                    },
                    controller: birthDayInputController,
                      readOnly: true,
                      decoration: InputDecoration(
                        errorText: errorTextBirthday,
                        suffixIcon: const Icon(Icons.date_range,color: Colors.grey,),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: Colors.black38)
                        ),
                        contentPadding: birthday != '' ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16) :
                        const EdgeInsets.symmetric(vertical: 10),
                      )
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
                  Text(S.of(context).myLevel),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                        offset: Offset(0, 0),
                    ),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
                        errorText: errorTextLevel,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(color: Colors.black26)
                        )
                    ),
                    value: level,
                    isExpanded: true,
                    iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                    onChanged: (String? value) async {
                      level = value;
                      errorTextLevel = null;
                      setState(() {
                        level;
                        errorTextLevel;
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
                  Text(S.of(context).wantToLearn),
                ],
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: [
                  for(int i= 0;i<listTestPreparation.length;i++)
                    FilterChip(
                      label: Text(listTestPreparation[i].name, style: const TextStyle(color: Colors.black),),
                      selectedColor: AppColors.chipSelectedBackground,
                      onSelected: (value){
                        if(value == true){
                          testPreparations.add(listTestPreparation[i].id);
                        }
                        else{
                          testPreparations.remove(listTestPreparation[i].id);
                        }
                        validateWantToLearnInput();
                        setState(() {
                          testPreparations;
                        });
                      },
                      selected: checkIsSelectedTestPreparation(listTestPreparation[i].id),
                    ),
                  for(int i= 0;i<listLearnTopic.length;i++)
                    FilterChip(
                      label: Text(listLearnTopic[i].name, style: const TextStyle(color: Colors.black),),
                      selectedColor: AppColors.chipSelectedBackground,
                      iconTheme: const IconThemeData(color: Colors.black),
                      onSelected: (value){
                        if(value == true){
                          learnTopics.add(listLearnTopic[i].id);
                        }
                        else{
                          learnTopics.remove(listLearnTopic[i].id);
                        }
                        validateWantToLearnInput();
                        setState(() {
                          learnTopics;
                        });
                      },
                      selected: checkIsSelectedLearnTopic(listLearnTopic[i].id),
                    ),
                ],
              ),
              !isWantToLearnEmpty ? Container() :
                Text(S.of(context).wantToLearnNotEmpty,style: const TextStyle(color: Colors.red),),
              const SizedBox(height: 16,),
              Text(S.of(context).studySchedule),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: Colors.black26)
                ),
                child: TextField(
                  controller: scheduleInputController,
                  maxLines: 4,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: S.of(context).studyScheduleHint
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
                        final isValid = [validateNameInput(nameInputController.text),
                          validateCountryInput(),
                          validateLevelInput(),validateBirthdayInput(),
                        validateWantToLearnInput()].every((element) => element == true);
                        log('isValid $isValid');
                        if(isValid){
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
                          showSuccessToast(S.of(context).editProfileSuccess);
                        }
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
                    child: Text(S.of(context).save,
                      style: const TextStyle(color: Colors.white, fontSize: 18),)
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
