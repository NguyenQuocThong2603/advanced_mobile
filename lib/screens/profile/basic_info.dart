import 'dart:io';

import 'package:advanced_mobile/config/color.dart';
import 'package:advanced_mobile/providers/user_provider.dart';
import 'package:advanced_mobile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({
    Key? key,
    required this.userProvider,
    required this.avaPath,
    required this.setAvaPath
  }) : super(key: key);

  final UserProvider userProvider;
  final String? avaPath;
  final setAvaPath;
  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final ImagePicker imagePicker = ImagePicker();
  Future<void> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      widget.setAvaPath(pickedFile.path);
    } else {
      showErrorToast("Can't upload photo");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
                children:[
                  Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                          child: widget.avaPath == null ? Image(
                            image: NetworkImage(
                                widget.userProvider.userInfo!.avatar!),
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: SvgPicture.asset("asset/svg/default_avatar.svg"),
                                  )
                              );
                            },
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ) : Image.file(
                              File(widget.avaPath!),
                            width: 80,
                            height: 80,
                          ),
                      )
                  ),
                  Positioned(
                    right: 5,
                    bottom: 2,
                    child: GestureDetector(
                      onTap: ()  {
                          pickImageFromGallery();
                      },
                      child: Container(
                        width: 30,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: const Icon(Icons.photo_camera, color: Colors.white, size: 24,),
                      ),
                    ),
                  ),
                ]
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              constraints: const BoxConstraints(maxWidth: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.userProvider.userInfo!.name!, style: const TextStyle(fontSize: 16),),
                  const SizedBox(height: 8,),
                  Text(
                    widget.userProvider.userInfo!.email!,
                    style: TextStyle(color: AppColors.textGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
