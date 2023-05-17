import 'package:advanced_mobile/config/advanced_setting.dart';
import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/setting_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvancedSetting extends StatefulWidget {
  const AdvancedSetting({Key? key}) : super(key: key);

  @override
  State<AdvancedSetting> createState() => _AdvancedSettingState();
}

class _AdvancedSettingState extends State<AdvancedSetting> {
  late String language;
  late String theme;
  @override
  void initState() {
    super.initState();
    language = context.read<SettingProvider>().language;
    theme = context.read<SettingProvider>().theme;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.navigate_before,size: 30,)
            ),
            Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(S.of(context).advancedSettings,)
            )
          ],
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.language, color: AppColors.primary,),
                  const SizedBox(width: 4,),
                  Text(
                    S.of(context).language,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.primary),),
                ],
              ),
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
                  value: language,
                  isExpanded: true,
                  iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                  onChanged: (value) async {
                    setState(() {
                      language = value!;
                    });
                    await context.read<SettingProvider>().changeLanguage(language);
                  },
                  items: languageSettingMapping(context).entries.map((e){
                    return DropdownMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                            e.key == 'english' ? const Image(
                            image: AssetImage("asset/img/us-flag.jpg"),
                            width: 40,
                            height: 50,
                          ) : const Image(
                              image: AssetImage("asset/img/vietnam-flag.png"),
                              width: 40,
                              height: 50,
                            ),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              e.value,
                              style: const TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ]
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: AppColors.primary,),
                  const SizedBox(width: 4,),
                  Text(
                    S.of(context).theme,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.primary),),
                ],
              ),
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
                  value: theme,
                  isExpanded: true,
                  iconStyleData: const IconStyleData(icon: Icon(Icons.expand_more)),
                  onChanged: (value) async {
                    setState(() {
                      theme = value!;
                    });
                    await context.read<SettingProvider>().changeTheme(theme);
                  },
                  items: themeMapping(context).entries.map((e){
                    return DropdownMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                          e.key == 'dark' ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
                          const SizedBox(width: 4,),
                          Text(e.value),
                        ],
                      )
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
