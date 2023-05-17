import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/screens/advanced_setting/advanced_setting.dart';
import 'package:advanced_mobile/screens/history/history.dart';
import 'package:advanced_mobile/screens/profile/profile.dart';
import 'package:advanced_mobile/screens/setting/setting_option_card.dart';
import 'package:advanced_mobile/utils/authentication_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,userProvider,_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).settings,
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen())
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                              child: Image(
                                image: NetworkImage(
                                    userProvider.userInfo!.avatar!),
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                                      )
                                  );
                                },
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                          )
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userProvider.userInfo!.name!, style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 8,),
                          Text(userProvider.userInfo!.email!, style: TextStyle(color: AppColors.textGrey),),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32,),
                Expanded(
                  child: Column(
                    children: [
                       SettingOptionCard(
                          name: S.of(context).history,
                          icon: Icons.history,
                          screen: const HistoryScreen()),
                       const SizedBox(height: 24,),
                       SettingOptionCard(
                          name: S.of(context).advancedSettings,
                          icon: Icons.settings, 
                          screen: const AdvancedSetting()
                      ),
                    ],
                  )
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () async{
                              await logout(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                  )
                              ),
                            ),
                            child: Text(S.of(context).logout,
                              style: const TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        );
      }
    );
  }
}
