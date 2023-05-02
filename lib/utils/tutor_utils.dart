import 'package:advanced_mobile/models/tutor/tutor_model.dart';

List<Tutor> sortTutorByFavoriteAndRating(List<Tutor> tutors){
  List<Tutor> favoriteTutorList = tutors.where((element) => element.isFavorite == true).toList();
  favoriteTutorList.sort((a,b) => b.rating!.compareTo(a.rating!));

  List<Tutor> unFavoriteTutorList = tutors.where((element) => element.isFavorite != true).toList();
  unFavoriteTutorList.sort((a,b) => b.rating!.compareTo(a.rating!));
  return favoriteTutorList.followedBy(unFavoriteTutorList).toList();
}