import 'package:advanced_mobile/models/tutor/tutor_model.dart';
import 'package:advanced_mobile/services/tutor_service.dart';
import 'package:flutter/cupertino.dart';

class TutorProvider extends ChangeNotifier{
  List<Tutor> tutors = [];
  int nationalityIndex = 0;
  final nationalities = ['None','Vietnamese','Native'];


  Future<void> getListTutors(String speciality, BuildContext context) async{
      final response = await TutorService.getListTutors(speciality);
      if(response.data['statusCode'] == 401){
        Navigator.pop(context);
      }
      if (response.data['statusCode'] == 200) {
        final List<dynamic> data = response.data['rows'];
        var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
        result.sort((a,b) => b.rating!.compareTo(a.rating!));
        tutors =  result;
        notifyListeners();
      } else {
        throw Exception(response.data['message']);
      }
  }
  Future<void> searchTutorByName(
      String name, String speciality,String nationality,context) async{
    Object data = {};
    if(nationality == 'Vietnamese') {
      data = {"isVietNamese": true};
      nationalityIndex = 1;
    } else if(nationality == 'Native'){
      data = {"isNative": true};
      nationalityIndex = 2;
    }
    else{
      nationalityIndex = 0;
    }
    final response = await TutorService.searchTutorByName(name,speciality,data);
    if(response.data['statusCode'] == 401){
      Navigator.pop(context);
    }
    if (response.data['statusCode'] == 200) {
      final List<dynamic> data = response.data['rows'];
      var result = data.map((tutor) => Tutor.fromJson(tutor)).toList();
      result.sort((a,b) => b.rating!.compareTo(a.rating!));
      tutors =  result;
      notifyListeners();
      Navigator.pop(context);
    } else {
      throw Exception(response.data['message']);
    }
  }
}