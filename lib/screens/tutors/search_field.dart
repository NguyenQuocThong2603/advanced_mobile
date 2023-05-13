import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:advanced_mobile/services/tutor_service.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.speciality,
    required this.tutorProvider,
    required this.setFilter
  }) : super(key: key);

  final String speciality;
  final TutorProvider tutorProvider;
  final Function setFilter;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController searchInputController;

  @override
  void initState(){
    super.initState();
    searchInputController = TextEditingController();
  }
  @override
  void dispose(){
    searchInputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
            controller: searchInputController,
            onSubmitted: (value) async{
              widget.tutorProvider.removeTutorsState();
              widget.setFilter(
                searchInputController.text,
                widget.tutorProvider.nationalities[widget.tutorProvider.nationalityIndex],
              );
              await widget.tutorProvider.searchTutorByName(
                  searchInputController.text,
                  widget.speciality!,
                  widget.tutorProvider.nationalities[widget.tutorProvider.nationalityIndex],
                  1,
                  12,
                  true,
                  context
              );
            },
            style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: "Enter tutor name")),
      );
  }
}
