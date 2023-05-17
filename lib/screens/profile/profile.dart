import 'package:advanced_mobile/generated/l10n.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/screens/profile/basic_info.dart';
import 'package:advanced_mobile/screens/profile/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? avaPath;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  void setAvaPath(path){
    setState(() {
      avaPath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Consumer<UserProvider>(
        builder: (context,userProvider,_) {
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
                    child: Text(
                      S.of(context).profile,
                    ),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BasicInfo(userProvider: userProvider, avaPath: avaPath, setAvaPath: setAvaPath),
                    const SizedBox(height: 8,),
                    DetailInfo(userProvider: userProvider,avaPath: avaPath),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
